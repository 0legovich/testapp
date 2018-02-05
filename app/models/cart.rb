class Cart < ApplicationRecord
  #belongs_to :order
  has_many   :cartitems
  has_many   :items, through: :cartitems

  def add_item(item_params)
    if self.items.include?(item_params)
      cartitem = self.cartitems.find_by(item: item_params)
      cartitem.quantity += 1
      cartitem.save
    else
      new_cartitem = Cartitem.create(item: item_params, cart: self)
    end
      new_cartitem
  end

  def sub_total
    sum = 0
    self.cartitems.each do |cartitem|
      sum += cartitem.total_price
    end
      sum
  end
end
