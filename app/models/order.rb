class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customers

  enum payment_method:[クレジットカード:0, 銀行振込:1]
  enum order_status:[入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4]
  
  
  def shipping_cost
    order.address * 1 + 800
  end
  
  def total_payment
    (self.order_item.total_price + 800)
  end

end
