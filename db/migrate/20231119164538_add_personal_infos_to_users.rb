class AddPersonalInfosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :keresztnev, :string
    add_column :users, :vezeteknev, :string
    add_column :users, :fav_team, :string
  end
end
