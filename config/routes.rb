Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users
  resources :posts, except: :index
  resources :users, only: :show
  resources :musics, only: :index
  get "musics/search/artists", to: "musics#search_artists"
  get "musics/select/artist", to: "musics#select_artist"
  get "musics/search/songs", to: "musics#search_songs"
  get "musics/search/only/songs", to: "musics#search_only_songs"

  scope :artists do
    get "/search", to: "artists#search", as: :artists_search
  end
  resources :artists, only: [:index, :show]
  scope :albums do
    get "/search", to: "album#search", as: :albums_search
  end
  resources :albums, only: [:index, :show]
  scope :tracks do
    get "/search", to: "tracks#search", as: :tracks_search
  end
  resources :tracks, only: [:index, :show]
end
