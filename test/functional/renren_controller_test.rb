require 'test_helper'

class RenrenControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get loginnext" do
    get :loginnext
    assert_response :success
  end

  test "should get message" do
    get :message
    assert_response :success
  end

end
