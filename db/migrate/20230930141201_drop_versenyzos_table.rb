class DropVersenyzosTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :versenyzos
    drop_table :szeria
  end
end
