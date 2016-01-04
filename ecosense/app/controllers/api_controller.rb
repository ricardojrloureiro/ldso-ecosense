class ApiController < ApplicationController
  before_action :doorkeeper_authorize!
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
      if posts.find(post['id']).avatar.path(:medium).nil?
        post[:image_url] = ""
      else
        post[:image_url] = posts.find(post['id']).avatar.url(:medium)
      end

    end
    render json: postsToReturn
  end

  def image
    params[:post_id]
    imageLocation = Post.find(params[:post_id]).avatar.url(:medium)
    data = open(imageLocation)
    send_file data, type: 'image/jpeg', disposition: 'inline'
  end


  def create
    post = Post.new(post_params)
    post.user_id = current_resource_owner.id
    params[:company_id] != 0 ? post.company_id=params[:company_id] : post.company_id = 0

    if(post.company_id != 0)
    if Company.where(:id => post.company_id).blank?
      render json: { success: false, msg: "Company not found." }
      return
    end
    if Company.find(post.company_id).user_id != post.user_id
      render json: { success: false, msg: "Company given not valid." }
      return
    end
    end


    if post.valid?
      post.save
      render json: { success: true, msg: "Post created successfully." }
    else
      render json: {success: false, msg: post.errors}
    end

  end

  def like
    post = Post.find(current_resource_owner.id)
    like = Like.where(post_id: post.id, user_id: current_resource_owner.id)
    if like.present?
      like.destroy_all
    else
      like = Like.new
      like.user_id = current_resource_owner.id
      like.post_id = post.id
      like.save
    end
    render json: { success: true, likes: pluralize(post.likes.count, 'like') }
  end

  def share
    post = Post.find(params[:id])
    share = Share.where(post_id: post.id, user_id: current_resource_owner.id)
    message = ''
    if share.present?
      share.destroy_all
      message = 'removed shared post'
    else
      share = Share.new
      share.user_id = current_resource_owner.id
      share.post_id = post.id
      share.save
      message = 'shared post successfully'
    end
    render json: { success: true, message: message }

  end

  def top_companies
    render json: Company.get_top_companies
  end


  def post_params
    params.permit(:title, :teaser, :content, :latitude, :longitude, :ecological_issue, :avatar)
  end

  private

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
