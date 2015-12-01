class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.now[:success] = "Category created successfully"
      redirect_to admin_categories_path
    else
      redirect_to admin_categories_path
    end

  end


  def destroy
    category = Category.find(params[:id])
    if category.destroy
      render json: {success: true, msg: "Category removed successfully."}
    else
      render json: {success: false, msg: "Category could not be removed."}
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

end
