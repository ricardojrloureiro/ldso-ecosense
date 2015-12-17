class CompaniesController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  before_action :logged_in_user,   only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    search = params[:category]
    if search == nil
      search = ''
    end

    category = Category.where(name: search)

    @companies = Company.joins(:categories).where(:categories => {:name => search})
    @categories = Category.all

  end

  def show_specific
    @company = Company.find(params[:id])
    @categories = @company.categories
    render 'show'
  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def create
    @company = Company.new(company_params)
    @categories = Category.all
    @company.user_id = current_user.id
    @company.save!
    if @company.save
      params[:categories].each do |category|
        @company.categories << Category.find(category)
      end
      @company.categories_count =params[:categories].count

      flash.now[:success] = "Company created successfully"
      redirect_to user_company_path :id => @company.id
    else
      @company = Company.new
      @categories = Category.all  
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
      @company.categories_count =params[:categories].count

      flash[:success] = "Your company profile was successfully updated!"
      redirect_to user_company_path
    else
      render 'edit'
    end
  end

  def show
    @company = Company.find(params[:id])
    @categories = @company.categories
  end


  def approve
    company = Company.find(params[:company_id])
    company.approved = true

    if company.save
      render json: {company: company, success: true, msg: "Company approved successfully."}
    else
      render json: {success: false, msg: "Company could not be approved."}

    end
  end

  def disapprove
    company = Company.find(params[:company_id])
    company.approved = false

    if company.save
      render json: {company: company, success: true, msg: "Company disapproved successfully."}
    else
      render json: {success: false, msg: "Company could not be disapproved."}

    end
  end

  def destroy
    company = Company.find(params[:company_id])
    if company.destroy
      render json: {success: true, msg: "Company removed successfully."}
    else
      render json: {success: false, msg: "Company could not be removed."}
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
