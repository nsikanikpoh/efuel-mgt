class AddCompanyIdToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :company_id, :integer
  end
end
