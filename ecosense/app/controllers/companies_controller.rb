class CompaniesController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  before_action :logged_in_user,   only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index

  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def create
    @company = Company.new(company_params)
    @categories = Category.all
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
    @company = Company.find(params[:id])
    @categories = Category.all
  end

  def update
    @company = Company.find(params[:id])
    @categories = Category.all
    if @company.update_attributes(company_params)
      @company.categories.clear
      params[:categories].each do |category|
        @company.categories << Category.find(category)
      end

      flash[:success] = "Your company profile was successfully updated!"
      redirect_to user_company_path
    else
      render 'edit'
    end
  end

  def show
    @company = Company.find(params[:id])
  end


  def approve
    company = Company.find(params[:company_id])
    company.approved = true

    if company.save
      render json: {company: company, success: true}
    else
      render json: {success: false}

    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :address, :about, :company_number, :avatar)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @company = Company.find(params[:id])
      @user = User.find(@company.user_id)
      if @user != current_user || params[:user_id].to_i != current_user.id
        redirect_to(root_url)
      end
    end

end
