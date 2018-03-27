class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :city
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
