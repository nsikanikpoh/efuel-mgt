class CreateStockTanks < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_tanks do |t|
      t.references :stock, foreign_key: true
      t.integer :stock_capacity, limit: 8
      t.float :sold_capacity
      t.float :sold_amount
      t.float :cost_price

      t.timestamps
    end
  end
end
