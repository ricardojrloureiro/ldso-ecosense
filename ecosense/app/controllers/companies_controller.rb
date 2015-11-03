class CompaniesController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  #before_filter :logged_in?, only: [:show]

  def index

  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      params[:categories].each do |category|
        @company.categories << Category.find(category)
      end

      flash.now[:success] = "Company created successfully"
      redirect_to user_company_path :id => @company.id
    else
      render 'new'
    end

  end

  def edit

  end

  def show
    @company = Company.find(params[:id])
  end

  private

    def company_params
      params.require(:company).permit(:name, :address, :about, :company_number, :avatar)
    end
end
