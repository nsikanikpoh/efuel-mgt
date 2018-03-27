class AddSlugToZones < ActiveRecord::Migration[5.1]
  def change
  	add_column :zones, :slug, :string
	add_index :zones, :slug, unique: true
  end
end
