json.array!(@songs) do |song|
  json.extract! song, :id, :user_id, :category, :favourite, :file
  json.url song_url(song, format: :json)
end
