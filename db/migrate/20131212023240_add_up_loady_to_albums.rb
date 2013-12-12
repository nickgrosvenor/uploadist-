class AddUpLoadyToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :upload_file_name, :string
    add_column :albums, :upload_file_size, :string
    add_column :albums, :upload_content_type, :string
    add_column :albums, :upload_updated_at, :string
  end
end
