class CreateSalesReports < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_reports do |t|
      t.integer :station_id
      
      t.references :product, foreign_key: true
      t.string :pump_attendant_name
      t.integer :pump_attendat_phone, limit: 8
      t.float :met_at_reading
      t.float :left_at_reading
      t.float :sold_capacity
      t.float :estimate_amount
      t.float :amount_brought
      t.integer :remark

      t.timestamps
    end
  end
end
