class MusicsController < ApplicationController

  # def search_only_songs
  #   if params[:search].present?
  #     @songs = search_track(params[:search])
  #     @artists = search_artist_from_songs(@songs)
  #   end
  #   respond("select_song")
  # end

  # private

  # def songs_filter_from_artist_id(songs)
  #   artist_songs = []
  #   songs.length.times do |i|
  #     if songs[i].artists[0].id == params[:artist_id]
  #       artist_songs << songs[i]
  #     end
  #   end
  #   return artist_songs
  # end

  # def search_artist_from_songs(songs)
  #   artists = []
  #   songs.length.times do |i|
  #     artists << songs[i].artists[0]
  #   end
  #   return artists
  # end

  # def respond(render)
  #   respond_to do |format|
  #     format.html {render render}
  #     format.json
  #   end
  # end
end
