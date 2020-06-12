class Product < ApplicationRecord
    belongs_to :category
    has_many :comments
    has_many :order_items
    validates :category_id , presence:true 
    validates :prd_name , presence:true
    validates :prd_price , presence:true
    validates :prd_accessories , presence:true
    validates :prd_details , presence:true

   


end
