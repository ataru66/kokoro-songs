class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  def find_track(input)
    track = RSpotify::Track.find(input)
  end

  def find_artist(input)
    artist = RSpotify::Artist.find(input)
  end

  def search_track(input)
    track = RSpotify::Track.search(input, limit: 50, market: 'JP')
  end

end
