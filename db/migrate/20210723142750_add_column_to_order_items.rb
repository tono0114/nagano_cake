class AddColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :item_id, :integer
    add_column :order_items, :order_id, :integer
  end
end
