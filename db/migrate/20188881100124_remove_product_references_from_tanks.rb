class RemoveProductReferencesFromTanks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tanks, :refrences, :product
  end
end
