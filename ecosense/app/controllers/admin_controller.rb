class AdminController < ApplicationController
  before_action :admin_user,   only: [:dashboard]


  def dashboard

  end

  def companies
    @companies = Company.all
  end


  def users
    @users = User.all
  end


  def categories
    @categories = Category.all
  end


  private

  def admin_user
    if !current_user.admin?
      redirect_to root_url
    end
  end

end
