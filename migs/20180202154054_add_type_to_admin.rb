class AddTypeToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :type, :string
  end
end
