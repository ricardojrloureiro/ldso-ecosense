class UsersController < ApplicationController
  # Require authentication for some user actions as the edit profile page
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    search = params[:name]
    if search == nil
      search = ''
    end
    @users = User.where('name LIKE ?','%'+search+'%')
    @categories = Category.all
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all


    @posts = []
    @user.posts.each do |p|
      @posts.push(p)
    end
    @user.shares.each do |s|
      s.post.created_at = s.created_at
      @posts.push(s.post)
    end

    @posts = @posts.sort! { |a,b| a.created_at.to_i <=> b.created_at.to_i }
    @posts = @posts.reverse

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the EcoSense!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile was successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {success: true, msg: "User removed successfully."}
    else
      render json: {success: false, msg: "User could not be removed."}
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :mobile_number, :about, :avatar, :password, :password_confirmation)
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
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
