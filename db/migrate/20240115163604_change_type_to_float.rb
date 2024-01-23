class ChangeTypeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :tracks, :lap_record_in_seconds, :float
    rename_column :tracks, :lap_record_driver_slug, :lap_record
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
