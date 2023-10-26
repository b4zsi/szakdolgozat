class AddTeamSlugToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :team_slug, :string
  end
end
