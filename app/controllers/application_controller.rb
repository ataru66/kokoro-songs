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
end
