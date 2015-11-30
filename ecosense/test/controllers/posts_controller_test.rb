require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get new" do
  	user = User.new
  	user.name = "Test"
  	user.email = "test@test.com"
  	user.save

    @request.session[:melo] = 'melo'

    #get :new, nil, {:user_id => 1, 'melo' => 'melo'}
    #assert_response :success
  end
end
