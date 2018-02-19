class Cart < ApplicationRecord
  has_many   :cartitems, dependent: :destroy
  has_many   :items, through: :cartitems

  # Если item уже есть в корзине, то добавляем к его количеству
  # единицу и перезаписываем cartitem. Если нет, создаем cartitem
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

  # Общая сумма заказа
  def sub_total
    sum = 0
    self.cartitems.each do |cartitem|
      sum += cartitem.total_price
    end

    sum
  end

  # Общее количество заказов
  def total_items
    self.cartitems.all.map(&:quantity).sum
  end
end
