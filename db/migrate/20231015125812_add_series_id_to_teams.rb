class AddSeriesIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :series_id, :integer
    add_column :drivers, :team_id, :integer
  end
end
