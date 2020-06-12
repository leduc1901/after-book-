class DeleteCatId < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :cat_id
  end
end
