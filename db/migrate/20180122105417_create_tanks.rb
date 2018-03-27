class CreateTanks < ActiveRecord::Migration[5.1]
  def change
    create_table :tanks do |t|
      
      t.references :pump, foreign_key: true
      t.integer :total_capacity, limit: 8
      t.integer :used_capacity, limit: 8
      t.integer :free_capacity, limit: 8

      t.timestamps
    end
  end
end
