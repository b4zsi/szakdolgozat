class AddNumberOfWinsToDriver < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :technical_director, :string
    add_column :teams, :first_win, :integer
    add_column :teams, :last_championship_win, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
