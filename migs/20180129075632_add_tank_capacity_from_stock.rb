class AddTankCapacityFromStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :tank_capacity, :float
  end
end
