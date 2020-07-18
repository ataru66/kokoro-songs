class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(updated_at: "DESC")
  end

  def new
    @track = RSpotify::Track.find(params[:track_id])
    @artist = RSpotify::Artist.find(params[:artist_id])
    @posts = Track.find_by(id: params[:track_id])&.posts&.order(updated_at: "DESC")
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to new_post_path(song_id: post.song_id)
  end

  def edit
    @song = find_track(@post.song_id)
    @artist = find_artist(@post.artist_id)
    @release_year = album_release_year(@song.album)
  end

  def update
    @post.update(post_params)
    redirect_to new_post_path(song_id: @post.song_id)
  end

  def destroy
    @post.destroy
    redirect_to new_post_path(song_id: @post.song_id)
  end

  private
  def post_params
    params.require(:post).permit(:content, :artist_id, :song_id, :artist, :song).merge(user_id: current_user.id)
  def create_artist(artist)
  end

  def create_album(album)
  end

  def create_track(track)
  end

  def album_release_year(album)
    release_year = album.release_date.gsub(/-.+/, "")
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end
end
