class AddingColumsToTeamsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :technical_director, :string
    add_column :teams, :first_win, :integer
    add_column :teams, :last_championship_win, :integer
  end
end
