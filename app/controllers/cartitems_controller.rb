class CartitemsController < ApplicationController
  before_action :current_cart, only: %I[update create destroy]
  before_action :set_cart_item, only: %I[update destroy]

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

  def update
    data = {}
    @cart_item.update(cartitem_params)
    respond_to do |format|
      if @cart_item.save
        format.html {redirect_to cart_path(@current_cart)}
        format.js data['quantity'] = @cart_item.quantity
      end
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def set_cart_item
    @cart_item = Cartitem.find(params[:id])
  end

  def cartitem_params
    params.require(:cartitem).permit(:quantity)
  end
end
