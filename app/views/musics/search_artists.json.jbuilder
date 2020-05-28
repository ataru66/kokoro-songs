json.array! @artists do |artist|
  json.artist_id artist.id
  json.artist_name artist.name
end
