class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email, :allow_blank => true

  has_many :addresses
  has_many :cart_items
  has_many :orders

  def active_for_authentication?
    super && (self.is_active == true)
  end

  def full_address
    self.postal_code + " " + self.address + " " + self.last_name + self.first_name
  end

end
