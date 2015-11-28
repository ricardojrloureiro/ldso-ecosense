include ActionView::Helpers::TextHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {success:true, msg: 'Post deleted successfully.', redirect: root_path }
  end

  def show
    @post = Post.find(params[:id])
    @likes = @post.likes
    @comments = @post.comments
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    params[:post_as] != 0 ? post.company_id=params[:post_as] : post.company_id = null
    post.save

    redirect_to root_path
  end

  def update
    if current_user.present?
      post = Post.find(params[:id])

      if current_user.id == post.user_id || current_user.admin
        post.content = params[:content]
        post.teaser = params[:teaser]
        post.title = params[:title]

        post.save
        render json: {success: true, msg: 'Post updated successfully.' }
        return
      end

      render json: { error: true, msg: 'You are not allowed to update this post.' }

    end
    render json: {error: true, msg: 'User not logged in.' }

  end


  def post_params
    params.require(:post).permit(:title, :teaser, :content, :latitude, :longitude, :ecological_issue,:avatar)
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

  def comment
    post = Post.find(params[:id])
    comment = Comment.new
    comment.user_id = current_user.id
    comment.post_id = post.id
    comment.content = params[:content]
    comment.save

    render json: { success: true, commentAdded: comment, userAvatar: comment.user.avatar.url(:medium),
                   userName: comment.user.name, userPath: user_path(comment.user)
           }
  end

  def comment_destroy
    comment = Comment.find(params[:id])

    unless current_user.present?
      render json: { error: true, msg: 'User not logged in.' }
      return
    end


    if current_user.admin
      comment.destroy

      render json: { success: true, msg: 'Comment deleted successfully.' }
      return
    end

    if comment.user_id != current_user.id
      render json: { error: true, msg: "You can't delete another user comment"}
      return
    else
      comment.destroy

      render json: { success: true, msg: 'Comment deleted successfully.' }
    end
  end

  def comment_update
    if current_user.present?
      comment = Comment.find(params[:id])

      if current_user.id == comment.user_id || current_user.admin
        comment.content = params[:content]
        comment.save

        render json: {success: true, msg: 'Comment updated successfully.' }
        return
      end

      render json: { error: true, msg: 'You are not allowed to update this comment.' }

    end
    render json: {error: true, msg: 'User not logged in.' }
  end

end
