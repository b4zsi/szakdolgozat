class AddSeriesIdToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :series_id, :integer
  end
end
