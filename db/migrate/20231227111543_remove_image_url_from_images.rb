class RemoveImageUrlFromImages < ActiveRecord::Migration[7.0]
  def change
    remove_column :images, :image_url, :string
  end
end
