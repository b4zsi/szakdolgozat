class AddslugToDriversTeamsSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :slug, :string
    add_column :drivers, :slug, :string
    add_column :series, :slug, :string
  end
end
