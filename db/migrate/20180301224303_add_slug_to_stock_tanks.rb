class AddSlugToStockTanks < ActiveRecord::Migration[5.1]
  def change
  	add_column :stock_tanks, :slug, :string
	add_index :stock_tanks, :slug, unique: true
  end
end
