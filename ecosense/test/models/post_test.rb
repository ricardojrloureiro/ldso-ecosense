require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(teaser: "Teaser melaço", title: "Title",
                     content: "Content content content content content content")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "teaser should be present" do
    @post.teaser = "     "
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "     "
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end
end
