class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum create_status:[制作不可:0, 制作待ち:1, 製作中:2, 制作完了:3]

  def total_price
    order_item.order_price * amount
  end

end
