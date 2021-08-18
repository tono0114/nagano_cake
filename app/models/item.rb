class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre

  mount_uploader :image, ImageUploader

  def add_tax_price
    (self.price * 1.1).round
  end

end
