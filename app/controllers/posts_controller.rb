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
    track = RSpotify::Track.find(params[:post][:track_id])

    # DBに楽曲情報がない場合SpotifyDBから作成する/////
    artists = track.artists
    artists.each do |artist|
      if Artist.find_by(id: artist.id) === nil
        create_artist(artist)
      end
    end

    album = track.album
    if Album.find_by(id: album.id) === nil
      create_album(album)
    end

    if Track.find_by(id: track.id) === nil
      create_track(track)
    end
    # ///////////////////////////////

    post = Post.create(post_params)
    create_artists_posts(artists, post)
    redirect_to new_post_path(track_id: post.track_id, artist_id: artists[0].id)
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
    params.require(:post).permit(:content, :album_id, :track_id).merge(user_id: current_user.id)
  end

  def create_artist(artist)
    artist = RSpotify::Artist.find(artist.id)
    Artist.create(id: artist.id, name: artist.name, image: artist.images[0]["url"])
  end

  def create_album(album)
    Album.create(id: album.id, name: album.id, image: album.images[0]["url"], release_date: album.release_date)
    artists = album.artists
    artists.each do |artist|
      ArtistsAlbum.create(artist_id: artist.id, album_id: album.id)
    end
  end

  def create_track(track)
    Track.create(id: track.id, name: track.name, album_id: track.album.id)
    artists = track.artists
    artists.each do |artist|
      ArtistsTrack.create(artist_id: artist.id, track_id: track.id)
    end
  end

  def create_artists_posts(artists, post)
    artists.each do |artist|
      ArtistsPost.create(artist_id: artist.id, post_id: post.id)
    end
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
