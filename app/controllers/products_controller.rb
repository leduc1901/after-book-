class ProductsController < ApplicationController
    before_action :logged_in_user,  only: [:index,:edit, :update, :destroy]   
    def new 
        @product = Product.new
    end

    def index 
        @products = Product.all 
    end


    def create 
        @product = Product.new(product_params)
        if @product.save 
            if params[:product][:zzz] == nil 
                Product.last.destroy
                flash[:danger] = "Bạn không chọn ảnh, thêm mới thất bại"
                redirect_to products_path

            else 
                zz = params[:product][:zzz].original_filename
                path = File.join("app","assets", "images", zz)
                File.open(path, "wb") { |f| f.write(params[:product][:zzz].read) }
                @product.update_attribute(:prd_img , zz)
                flash[:success] = "Thêm Mới Thành Công"
                redirect_to products_path
            end
            
        else 

            render 'new'

        end
    end

    def update 
        @product = Product.find(params[:id])
        
        if @product.update_attributes(product_params)
            zz = params[:product][:zzz].original_filename
            
            path = File.join("app","assets", "images", zz)
            File.open(path, "wb") { |f| f.write(params[:product][:zzz].read) }
            @product.update_attribute(:prd_img , zz)
            flash[:success] = "Cập Nhật Thành Công"
            redirect_to products_path
        else 
            render 'edit'
        end
    end

    def edit 
        @product = Product.find(params[:id])
    end

    def destroy

    end

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in"
            redirect_to "/login"
        end
    end

    private
        def product_params
            params.require(:product).permit(:category_id, :prd_name, :prd_price , :prd_accessories , :prd_featured, :prd_status , :prd_details)
        end
end
