class StaticPagesController < ApplicationController
  def home
    @posts = Post.all.reverse_order
    @categories = Category.all
  end

  def help
  end

  def about
  end
end
