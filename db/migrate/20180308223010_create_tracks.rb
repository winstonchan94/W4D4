class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :ord, null: false
      t.integer :album_id, null: false
      t.text :lyrics
      t.boolean :bonus, null: false, default: false
    end
  end
end
