class RemoveQuantityFromOrderItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :quantity

  end
end
