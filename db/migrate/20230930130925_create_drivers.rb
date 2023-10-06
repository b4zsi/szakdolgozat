class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :age
      t.integer :number
      t.integer :height
      t.string :nationality
      t.integer :number_of_championsips

      t.timestamps
    end
  end
end
