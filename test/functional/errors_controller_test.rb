require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get error_404" do
    get :error_404
    assert_response 404
  end

  test "should get error_500" do
    get :error_500
    assert_response 500
  end
end
