require 'test_helper'

class DashboardAngularControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_angular_index_url
    assert_response :success
  end

end
