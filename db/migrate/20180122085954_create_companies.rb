class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :phone, limit: 8
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
