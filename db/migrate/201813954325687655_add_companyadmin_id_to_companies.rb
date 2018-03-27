class AddCompanyadminIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :companyadmin_id, :integer
  end
end
