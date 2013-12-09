class CreateAlbumPhotos < ActiveRecord::Migration
  def change
    create_table :album_photos do |t|
      t.references :photo, index: true
      t.references :album, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
