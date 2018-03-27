json.extract! sales_report, :id, :station_id, :stock_id, :product_id, :pump_attendant_name, :pump_attendat_phone, :met_at_reading, :left_at_reading, :sold_capacity, :estimate_amount, :amount_brought, :remark, :created_at, :updated_at
json.url sales_report_url(sales_report, format: :json)
