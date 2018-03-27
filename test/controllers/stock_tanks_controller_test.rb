require 'test_helper'

class StockTanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_tank = stock_tanks(:one)
  end

  test "should get index" do
    get stock_tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_tank_url
    assert_response :success
  end

  test "should create stock_tank" do
    assert_difference('StockTank.count') do
      post stock_tanks_url, params: { stock_tank: { cost_price: @stock_tank.cost_price, sold_amount: @stock_tank.sold_amount, sold_capacity: @stock_tank.sold_capacity, stock_capacity: @stock_tank.stock_capacity, stock_id: @stock_tank.stock_id } }
    end

    assert_redirected_to stock_tank_url(StockTank.last)
  end

  test "should show stock_tank" do
    get stock_tank_url(@stock_tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_tank_url(@stock_tank)
    assert_response :success
  end

  test "should update stock_tank" do
    patch stock_tank_url(@stock_tank), params: { stock_tank: { cost_price: @stock_tank.cost_price, sold_amount: @stock_tank.sold_amount, sold_capacity: @stock_tank.sold_capacity, stock_capacity: @stock_tank.stock_capacity, stock_id: @stock_tank.stock_id } }
    assert_redirected_to stock_tank_url(@stock_tank)
  end

  test "should destroy stock_tank" do
    assert_difference('StockTank.count', -1) do
      delete stock_tank_url(@stock_tank)
    end

    assert_redirected_to stock_tanks_url
  end
end
