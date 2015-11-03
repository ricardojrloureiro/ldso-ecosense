class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    abort @user.inspect

    @posts = Post.all
    render 'static_pages/home'
  end

  def post_params
    params.require(:post).permit(:title, :teaser, :content)
  end

end
