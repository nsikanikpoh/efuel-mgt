class AddSubNoToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :sub_no, :integer
  end
end
