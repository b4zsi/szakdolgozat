class RemoveTeamPictureFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :team_picture
  end
end
