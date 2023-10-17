class AddTeamPictureAndTeamColorToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :team_picture, :binary
    add_column :teams, :team_color, :string
  end
end
