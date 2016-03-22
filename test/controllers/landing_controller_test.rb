require "test_helper"

class LandingControllerTest < ActionController::TestCase
  def test_show
    get :show
    assert_response :success
  end

end
