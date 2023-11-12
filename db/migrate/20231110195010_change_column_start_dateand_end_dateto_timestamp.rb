class ChangeColumnStartDateandEndDatetoTimestamp < ActiveRecord::Migration[7.0]
  def change
    change_column :calendar_events, :startDate, :datetime
    change_column :calendar_events, :endDate, :datetime
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
