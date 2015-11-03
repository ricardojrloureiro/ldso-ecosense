class CompaniesController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  #before_filter :logged_in?, only: [:show]

  def show
    @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
     flash[:notice] = "Wrong Company ID"
  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def create
    @company = Company.new(user_params)
    if @company.save

      params[:categories].each do |category|
        @company.categories << Category.find(category)
      end

      log_in @company
      flash[:success] = "Welcome to the EcoSense!"
      redirect_to @company
    else
      render 'new'
    end


  end

  private

    def user_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end
end
