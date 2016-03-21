class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)

    if @category.save
      render :nothing => true
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
