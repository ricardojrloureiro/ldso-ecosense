class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def posts
    posts = Post.all.reverse_order.eager_load(:user,:comments,:comments => :user)
    postsToReturn = posts.as_json

    postsToReturn.each do |post|
      post[:name] = posts.find(post['id']).user.name
      post[:likes] = posts.find(post['id']).likes.count
      post[:comments] = posts.find(post['id']).comments.as_json
      post[:comments].each do |comment|
        comment[:name] = User.find(comment['user_id']).name
      end
      post[:image_url] = request.host + "/api/image/" + post['id'].to_s
    end
    render json: postsToReturn
  end

  def image
    params[:post_id]
    imageLocation = Post.find(params[:post_id]).avatar.path(:medium)
    data = open(imageLocation)
    send_file data, type: 'image/png', disposition: 'inline'
  end


  def create
    post = Post.new(post_params)
    post.user_id = params[:user_id]
    params[:company_id] != 0 ? post.company_id=params[:company_id] : post.company_id = 0

    if Company.where(:id => params[:company_id]).blank?
      render json: { success: false, msg: "Company not found." }
      return
    end
    if Company.find(params[:company_id]).user_id != post.user_id
      render json: { success: false, msg: "Company given not valid." }
      return
    end


    if post.valid?
      post.save
      render json: { success: true, msg: "Post created successfully." }
    else
      render json: {success: false, msg: post.errors}
    end

  end

  def like
    post = Post.find(params[:id])
    like = Like.where(post_id: post.id, user_id: params[:user_id])
    if like.present?
      like.destroy_all
    else
      like = Like.new
      like.user_id = params[:user_id]
      like.post_id = post.id
      like.save
    end
    render json: { success: true, likes: pluralize(post.likes.count, 'like') }
  end

  def share
    post = Post.find(params[:id])
    share = Share.where(post_id: post.id, user_id: params[:user_id])
    message = ''
    if share.present?
      share.destroy_all
      message = 'removed shared post'
    else
      share = Share.new
      share.user_id = params[:user_id]
      share.post_id = post.id
      share.save
      message = 'shared post successfully'
    end
    render json: { success: true, message: message }

  end


  def post_params
    params.permit(:title, :teaser, :content, :latitude, :longitude, :ecological_issue, :avatar)
  end

end
