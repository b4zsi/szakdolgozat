class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number_of_championships
      t.integer :number_of_races
      t.string :headquarters_city
      t.date :date_of_establishment

      t.timestamps
    end
  end
end
