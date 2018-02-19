class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.cartitems.each do |cartitem|
      @order.cartitems << cartitem
      cartitem.cart_id = nil
    end

    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_name, :phone, :email, :address)
  end
end
