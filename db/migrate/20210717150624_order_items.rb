class OrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.integer :order_price
      t.integer :amount
      t.integer :create_status
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
