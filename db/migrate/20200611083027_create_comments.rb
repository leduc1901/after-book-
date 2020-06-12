class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.string :name
      t.string :mail
      t.text :details

      t.timestamps
    end
  end
end
