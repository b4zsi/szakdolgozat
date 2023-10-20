class CreateImagestable < ActiveRecord::Migration[7.0]
  def change
    create_table :imagestables do |t|
      t.binary :image_url
      t.string :image_name

      t.timestamps
    end
  end
end
