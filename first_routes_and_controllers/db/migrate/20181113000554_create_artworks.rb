class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :artworks, :artist_id
    add_index :artworks, [:title, :artist_id], unique: true
    # add_foreign_key :artworks, :artist_id
  end
end
