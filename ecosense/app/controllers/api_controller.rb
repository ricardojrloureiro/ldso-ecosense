class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def posts
    posts = Post.all.reverse_order.eager_load(:user,:comments,:comments => :user)
    postsToReturn = posts.as_json

    postsToReturn.each do |post|
      post[:name] = posts.find(post['id']).user.name
      post[:comments] = posts.find(post['id']).comments.as_json
      post[:comments].each do |comment|
        comment[:name] = User.find(comment['user_id']).name
      end
    end
    render json: postsToReturn
  end

  def create
    post = Post.new(post_params)
    post.user_id = params[:user_id]
    params[:company_id] != 0 ? post.company_id=params[:company_id] : post.company_id = null

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

  def post_params
    params.permit(:title, :teaser, :content, :latitude, :longitude, :ecological_issue, :avatar)
  end

end
