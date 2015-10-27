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
      log_in @company
      flash[:success] = "Welcome to the EcoSense!"
      redirect_to @company
    else
      render 'new'
    end
  end

  def login_show
    render 'login_show'
  end

  def login
    company = Company.find_by(email: params[:session][:email].downcase)
    if company && company.authenticate(params[:session][:password])
      log_in company
      redirect_to company
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def logout
    log_out
    redirect_to root_url
  end


  private

  def user_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
end
