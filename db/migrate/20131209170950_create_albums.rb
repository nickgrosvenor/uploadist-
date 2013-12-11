class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :user, index: true
      t.string :direct_upload_url, null: false
      t.string :name
      t.string :url
      t.attachment :upload
      t.boolean :processed, default: false, null: false, index: true

      t.timestamps
    end
  end
end

