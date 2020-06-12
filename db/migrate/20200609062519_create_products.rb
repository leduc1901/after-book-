class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :cat_id
      t.string :prd_name
      t.string :prd_img
      t.integer :prd_price
      t.string :prd_accessories
      t.boolean :prd_featured
      t.boolean :prd_status
      t.text :prd_details

      t.timestamps
    end
  end
end
