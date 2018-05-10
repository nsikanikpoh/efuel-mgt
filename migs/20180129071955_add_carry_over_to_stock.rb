class AddCarryOverToStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :carry_over, :float
  end
end
