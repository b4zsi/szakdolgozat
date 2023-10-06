class AddColumnToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :date_of_establishment, :integer
  end
end
