json.array!(@albums) do |album|
  json.extract! album, :id, :user_id, :name, :url
  json.url album_url(album, format: :json)
end
