class AddPlusAttributesToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :podiums, :integer
    add_column :cars, :championship_place, :string
    add_column :cars, :battery, :string
    add_column :cars, :horsepower, :integer
    add_column :cars, :weight, :integer
    add_column :cars, :fuel, :string
    add_column :cars, :lubricants, :string
    add_column :cars, :description, :string
  end
end
