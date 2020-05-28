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
end
