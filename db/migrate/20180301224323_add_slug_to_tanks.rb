class AddSlugToTanks < ActiveRecord::Migration[5.1]
  def change
  	add_column :tanks, :slug, :string
	add_index :tanks, :slug, unique: true
  end
end
