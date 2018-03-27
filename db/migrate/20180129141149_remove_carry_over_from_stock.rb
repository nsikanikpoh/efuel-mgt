class RemoveCarryOverFromStock < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :carry_over, :float
  end
end
