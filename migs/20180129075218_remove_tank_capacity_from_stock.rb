class RemoveTankCapacityFromStock < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :tank_capacity, :integer
  end
end
