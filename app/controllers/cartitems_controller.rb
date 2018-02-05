class CartitemsController < ApplicationController
  before_action :current_cart, only: %I[create destroy]
  before_action :set_cart_item, only: %I[add_quantity reduce_quantity destroy]

  def create
    item = Item.find(params[:item_id])
    cart = @current_cart
    cart.add_item(item)

    if cart.save
      redirect_to cart_path(@current_cart)
    else
      flash[:error] = 'Не удалось добавить товар в карзину'
      redirect_to item_path(item)
    end
  end

  def add_quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart) if @current_cart.presence
  end

  def reduce_quantity
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart) if @current_cart.presence
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@current_cart) if @current_cart.presence
  end

  private

  def set_cart_item
    @cart_item = Cartitem.find(params[:id])
  end
end
