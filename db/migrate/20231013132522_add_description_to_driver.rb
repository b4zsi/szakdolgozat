class AddDescriptionToDriver < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :description, :text
  end
end
