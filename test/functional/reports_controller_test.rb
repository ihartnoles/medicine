require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get reportseven" do
    get :reportseven
    assert_response :success
  end

end
