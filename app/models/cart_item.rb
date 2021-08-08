class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true

  def total_price
    (item.add_tax_price * amount) * 1.08.round
  end

  def self.sum_price
    sum {|cart_item| cart_item.total_price}
  end

  def self.total_payment
    sum {|cart_item| cart_item.total_price} + 800
  end

end
