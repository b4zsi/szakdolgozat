class AddSlugToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :slug, :string
  end
end
