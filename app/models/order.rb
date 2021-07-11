class Order < ApplicationRecord
  has_many :order_items,dependent: :destroy
  belongs_to :customers,dependent: :destroy
end
