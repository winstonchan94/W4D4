class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, null: false, default: false
    end
  end
end
