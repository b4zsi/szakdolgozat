class SetDefaultValuesForTeam < ActiveRecord::Migration[7.0]
  def change
    change_column_default :teams, :number_of_championships, 0
    change_column_default :teams, :number_of_races, 0
    change_column_default :teams, :headquarters_city, ""
    change_column_default :teams, :technical_director, ""
    change_column_default :teams, :first_win, 0
    change_column_default :teams, :last_championship_win, 0
    change_column_default :teams, :date_of_establishment, 0
    change_column_default :teams, :team_color, ""
    change_column_default :teams, :description, ""
    change_column_default :teams, :slug, ""
  end
end
