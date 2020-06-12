class ClientController < ApplicationController
  
    def index
        @products =  Product.all
        @categories = Category.all
        @products1 = @products.where(:prd_featured => true).order(id: :desc).limit(6)
        @products2 = @products.where(:prd_featured => false).order(id: :desc).limit(6)
    end
    
    def category 
        @category = Category.find(params[:id])
        @categories = Category.all
        @products = Product.where(:category_id => params[:id])
    end
      
    def details 
        @order_item = current_order.order_items.new
        @comments = Comment.where(:product_id => params[:id])
        @categories = Category.all
        @product =  Product.find(params[:id])
        @comment = Comment.new
    end

    def comment 
        @categories = Category.all

       

        @comment = Comment.new(comment_params)
        @product =  Product.find(@comment.product_id)
        @comments = Comment.where(:product_id => @comment.product_id)

        if @comment.save
            redirect_to details_path(@comment.product_id)
        else 
            render 'details'
        end
    end

    def search
        @categories = Category.all
        if params[:search].blank?  
            redirect_to(root_url, alert: "Empty field!")  
          else  
            @parameter = params[:search].downcase  
            @products = Product.all.where("prd_name LIKE ?", "%#{@parameter}%")  
          end  
    end


    private
        
        def comment_params
            params.require(:comment).permit(:product_id ,:name, :mail , :details)
        end

end
