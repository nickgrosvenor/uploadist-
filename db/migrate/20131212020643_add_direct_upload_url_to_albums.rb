class AddDirectUploadUrlToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :direct_upload_url, :string
  end
end
