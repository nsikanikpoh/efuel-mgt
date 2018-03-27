require 'test_helper'

class ZonalManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zonal_managers_index_url
    assert_response :success
  end

  test "should get new" do
    get zonal_managers_new_url
    assert_response :success
  end

  test "should get edit" do
    get zonal_managers_edit_url
    assert_response :success
  end

  test "should get create" do
    get zonal_managers_create_url
    assert_response :success
  end

  test "should get update" do
    get zonal_managers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get zonal_managers_destroy_url
    assert_response :success
  end

end
