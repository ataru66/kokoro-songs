json.songs do
  json.array! @songs do |song|
    json.song_id song.id
    json.song_name song.name
  end
end
json.artists do
  json.array! @artists do |artist|
    json.artist_id artist.id
    json.artist_name artist.name
  end
end
