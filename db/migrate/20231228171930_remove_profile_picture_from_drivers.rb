class RemoveProfilePictureFromDrivers < ActiveRecord::Migration[7.0]
  def change
    remove_column :drivers, :profile_picture
  end
end
