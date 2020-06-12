class Comment < ApplicationRecord

    belongs_to :product

    validates :name, presence:true , length:{maximum:50}, uniqueness:true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence:true , length:{maximum:255},format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive:false}
    validates :details , presence:true 
end
