class CreatePumps < ActiveRecord::Migration[5.1]
  def change
    create_table :pumps do |t|
      t.string :name
      t.references :station, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
