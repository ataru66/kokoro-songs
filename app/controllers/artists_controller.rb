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

end
