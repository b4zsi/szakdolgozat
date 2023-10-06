class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series do |t|
      t.string :name
      t.integer :number_of_drivers
      t.integer :number_of_races
      t.integer :number_of_teams

      t.timestamps
    end
  end
end
