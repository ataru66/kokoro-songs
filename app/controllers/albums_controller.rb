class AlbumsController < ApplicationController

  def show
    @artist = RSpotify::Artist.find(params[:artist_id])
    @album = RSpotify::Album.find(params[:id])
    @tracks = @album.tracks
  end

end
