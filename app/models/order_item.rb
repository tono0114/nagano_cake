class OrderItem < ApplicationRecord
  belongs_to :orders,dependent: :destroy
  belongs_to :items,dependent: :destroy
end
