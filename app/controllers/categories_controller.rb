class CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_category_not_found

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

  def rescue_with_category_not_found
    redirect_to tests_path, alert: "Category not found"
  end
end
