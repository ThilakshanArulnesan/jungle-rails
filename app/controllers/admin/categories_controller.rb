class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:admin_username], password: Rails.configuration.admin[:admin_password]


  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new #create an object, don't save til create
  end


  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end

