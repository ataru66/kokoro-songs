class ArtistsController < ApplicationController

  def search
    if params[:search].present?
      @artists = RSpotify::Artist.search(params[:search], limit: 50, market: 'JP')
    end
    respond_to do |format|
      format.html
      format.json { render json: @artists }
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])
    @albums = @artist.albums(limit: 50, country: 'JP', album_type: 'album')
    @singles = @artist.albums(limit: 50, country: 'JP', album_type: 'single')
    @compilations = @artist.albums(limit: 50, country: 'JP', album_type: 'compilation')
  end

end
