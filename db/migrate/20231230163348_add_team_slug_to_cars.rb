class AddTeamSlugToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :team_slug, :string
  end
end
