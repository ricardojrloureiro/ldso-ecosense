class ApiController < ApplicationController

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

  end

end
