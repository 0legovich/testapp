class ItemsController < ApplicationController
  before_action :set_category, only: %I[create destroy]
  before_action :set_item, only: %I[edit update show destroy]

  def show
  end

  def create
    @item = @category.items.build(item_params)
    if @item.save
      redirect_to @category, notice: 'Item created'
    else
      render 'categories/show'
    end
  end

  def edit
  end

  def update
    if @category.items.update(item_params)
      redirect_to @category, notice: 'Item updated'
    else
      render 'categories/show'
    end
  end

  def destroy
    @item.destroy
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :weight, :price)
  end
end
