class CategoriesController < ApplicationController
  before_action :set_category, only: %I[show destroy]

  def index
    @categories = Category.all
  end

  def show
    @item = @category.items.build(params[:item])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
