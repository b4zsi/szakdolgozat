class AddingAdmintoUserstable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
