class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre

  def add_tax_price
    (self.price * 1.08).round
  end

end
