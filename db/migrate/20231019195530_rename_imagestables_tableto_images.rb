class RenameImagestablesTabletoImages < ActiveRecord::Migration[7.0]
  def change
    rename_table :imagestables, :images
  end
end
