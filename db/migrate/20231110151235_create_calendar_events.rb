class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.date :startDate
      t.date :endDate
      t.string :color

      t.timestamps
    end
  end
end
