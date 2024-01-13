class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :year
      t.string :engine
      t.string :chassis
      t.integer :races_won
      t.integer :pole_positions

      t.timestamps
    end
  end
end
