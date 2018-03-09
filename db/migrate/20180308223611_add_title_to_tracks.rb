class AddTitleToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :title, :string, null: false
  end
end
