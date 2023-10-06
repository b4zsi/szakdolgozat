class ChangeTeamsColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :date_of_establishment, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email") :teams, :date_of_establishment
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
