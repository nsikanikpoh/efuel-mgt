require 'test_helper'

class SalesReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_report = sales_reports(:one)
  end

  test "should get index" do
    get sales_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_report_url
    assert_response :success
  end

  test "should create sales_report" do
    assert_difference('SalesReport.count') do
      post sales_reports_url, params: { sales_report: { amount_brought: @sales_report.amount_brought, estimate_amount: @sales_report.estimate_amount, left_at_reading: @sales_report.left_at_reading, met_at_reading: @sales_report.met_at_reading, product_id: @sales_report.product_id, pump_attendant_name: @sales_report.pump_attendant_name, pump_attendat_phone: @sales_report.pump_attendat_phone, remark: @sales_report.remark, sold_capacity: @sales_report.sold_capacity, station_id: @sales_report.station_id, stock_id: @sales_report.stock_id } }
    end

    assert_redirected_to sales_report_url(SalesReport.last)
  end

  test "should show sales_report" do
    get sales_report_url(@sales_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_report_url(@sales_report)
    assert_response :success
  end

  test "should update sales_report" do
    patch sales_report_url(@sales_report), params: { sales_report: { amount_brought: @sales_report.amount_brought, estimate_amount: @sales_report.estimate_amount, left_at_reading: @sales_report.left_at_reading, met_at_reading: @sales_report.met_at_reading, product_id: @sales_report.product_id, pump_attendant_name: @sales_report.pump_attendant_name, pump_attendat_phone: @sales_report.pump_attendat_phone, remark: @sales_report.remark, sold_capacity: @sales_report.sold_capacity, station_id: @sales_report.station_id, stock_id: @sales_report.stock_id } }
    assert_redirected_to sales_report_url(@sales_report)
  end

  test "should destroy sales_report" do
    assert_difference('SalesReport.count', -1) do
      delete sales_report_url(@sales_report)
    end

    assert_redirected_to sales_reports_url
  end
end
