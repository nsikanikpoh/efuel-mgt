require 'test_helper'

class TanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tank = tanks(:one)
  end

  test "should get index" do
    get tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_tank_url
    assert_response :success
  end

  test "should create tank" do
    assert_difference('Tank.count') do
      post tanks_url, params: { tank: { free_capacity: @tank.free_capacity, product_id: @tank.product_id, station_id: @tank.station_id, total_capacity: @tank.total_capacity, used_capacity: @tank.used_capacity } }
    end

    assert_redirected_to tank_url(Tank.last)
  end

  test "should show tank" do
    get tank_url(@tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_tank_url(@tank)
    assert_response :success
  end

  test "should update tank" do
    patch tank_url(@tank), params: { tank: { free_capacity: @tank.free_capacity, product_id: @tank.product_id, station_id: @tank.station_id, total_capacity: @tank.total_capacity, used_capacity: @tank.used_capacity } }
    assert_redirected_to tank_url(@tank)
  end

  test "should destroy tank" do
    assert_difference('Tank.count', -1) do
      delete tank_url(@tank)
    end

    assert_redirected_to tanks_url
  end
end
