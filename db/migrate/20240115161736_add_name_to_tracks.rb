class AddNameToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :name, :string
    add_column :tracks, :country, :string
    add_column :tracks, :city, :string
    add_column :tracks, :length, :integer
    add_column :tracks, :turns, :integer
    add_column :tracks, :first_grand_prix, :integer
    add_column :tracks, :lap_record_in_seconds, :integer
    add_column :tracks, :lap_record_driver_slug, :string
    add_column :tracks, :is_street_circuit, :boolean
    add_column :tracks, :description, :string

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
