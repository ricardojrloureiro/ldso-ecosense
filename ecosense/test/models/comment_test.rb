require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content: "Comentário melaço")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content should be present" do
  	@comment.content = "   "
    assert_not @comment.valid?
  end
end
