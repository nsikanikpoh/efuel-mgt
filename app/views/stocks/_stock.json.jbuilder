json.extract! stock, :id, :description, :station_id, :tank_capacity, :product_id, :supplier, :cost_price, :cost_per_ltr, :selling_price_per_ltr, :estimate_profit_percent, :estimate_profit, :created_at, :updated_at
json.url stock_url(stock, format: :json)
