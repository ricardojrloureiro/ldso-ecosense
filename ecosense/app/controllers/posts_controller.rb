class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    params[:post_as] != 0 ? post.company_id=params[:post_as] : post.company_id = null
    post.save

    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :teaser, :content)
  end

end
