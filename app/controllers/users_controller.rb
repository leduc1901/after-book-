class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index,:edit, :update, :destroy]   
    before_action :correct_user,   only: [:edit, :update]
    before_action :admin_user,     only: :destroy
    def new 
        @user = User.new
    end

    def index 
        @users = User.paginate(page: params[:page])
    end

    def show
        @user = User.find(params[:id])
    end 

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Updated"
          redirect_to users_path
        else 
          render 'edit'
        end
    end
    

    def create
        @user = User.new(user_params)
        if(@user.save)
            log_in(@user)
            
            redirect_to "/admin"
        else 
            render "new"
            
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"  
        redirect_to users_url
    end

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in"
            redirect_to "/login"
        end
    end

    def correct_user

    end

    def admin_user
    end
    private
        def user_params
            params.require(:user).permit(:name, :email , :password , :password_confirmation)
        end
end
