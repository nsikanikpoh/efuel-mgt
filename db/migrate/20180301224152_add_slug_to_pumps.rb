class AddSlugToPumps < ActiveRecord::Migration[5.1]
  def change
  	add_column :pumps, :slug, :string
	add_index :pumps, :slug, unique: true
  end
end
