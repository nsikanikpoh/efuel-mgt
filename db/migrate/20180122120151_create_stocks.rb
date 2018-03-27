class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.text :description
      t.references :station, foreign_key: true
      t.integer :tank_capacity, limit: 8
      t.references :product, foreign_key: true
      t.string :supplier
      t.float :cost_price
      t.float :cost_per_ltr
      t.float :selling_price_per_ltr
      t.float :estimate_profit_percent
      t.float :estimate_profit

      t.timestamps
    end
  end
end
