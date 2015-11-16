include ActionView::Helpers::TextHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @likes = @post.likes
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

  def like
    post = Post.find(params[:id])
    like = Like.where(post_id: post.id, user_id: current_user.id)
    if like.present?
      like.destroy_all
    else   
      like = Like.new
      like.user_id = current_user.id
      like.post_id = post.id
      like.save
    end
    render json: { success: true, likes: pluralize(post.likes.count, 'like') }
  end

end
