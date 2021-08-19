class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.string  :postal_code
      t.string  :address
      t.string  :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status
      t.timestamp :created_at
      t.timestamp :updated_at

    end
  end
end
