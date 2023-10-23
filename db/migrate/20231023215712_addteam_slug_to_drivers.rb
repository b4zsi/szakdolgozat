class AddteamSlugToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :team_slug, :string
  end
end
