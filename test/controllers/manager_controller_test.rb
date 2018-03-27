require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_index_url
    assert_response :success
  end

  test "should get new" do
    get manager_new_url
    assert_response :success
  end

  test "should get edit" do
    get manager_edit_url
    assert_response :success
  end

  test "should get create" do
    get manager_create_url
    assert_response :success
  end

  test "should get update" do
    get manager_update_url
    assert_response :success
  end

  test "should get destroy" do
    get manager_destroy_url
    assert_response :success
  end

end
