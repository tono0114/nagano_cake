class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer

  accepts_nested_attributes_for :order_items, allow_destroy: true

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  attribute :shipping_cost, :integer, default: '800'

  #def full_address
  #  self.postal_code + " " + self.address + " " + self.name
  #end

end
