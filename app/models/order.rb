class Order < ApplicationRecord
  has_many :cartitems, dependent: :destroy
  validates :user_name, :phone, :email, :address, presence: true
end
