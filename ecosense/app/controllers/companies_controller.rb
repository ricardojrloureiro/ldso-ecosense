class CompaniesController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  #before_filter :logged_in?, only: [:show]

  def show

  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def create
    render 'new'
  end

  private

    def company_params
      params.require(:company).permit(:name, :address, :about, :company_number)
    end
end
