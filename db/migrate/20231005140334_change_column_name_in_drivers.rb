class ChangeColumnNameInDrivers < ActiveRecord::Migration[7.0]
  def change
    rename_column :drivers, :number_of_championsips, :number_of_championships
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
