class Item < ApplicationRecord
  belongs_to :category
  has_many   :cartitems, dependent: :destroy
  has_many   :carts, through: :cartitems
end
