class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.integer :phone, limit: 8
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
