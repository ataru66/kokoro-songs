require 'rails_helper'
require 'rspotify'
RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

describe PostsController do
  describe 'GET #index' do
    it '@postsの中身が期待通りであること' do
      posts = create_list(:post, 5)
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.updated_at <=> a.updated_at})
    end
    it 'posts/index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      @params = { song_id: "58dxGXavrcagRqA58fNB0Z", artist_id: "5Vo1hnCRmCM6M4thZCInCj" }
      @song = RSpotify::Track.find(@params[:song_id])
      @artist = @song.artists[0]
      @release_year = @song.album.release_date.gsub(/-.+/, "")
      @posts = create_list(:post, 3)
      get :new, params: @params
    end
    it '@songの中身が期待通りであること' do
      expect(assigns(:song)).to have_attributes(id: @song.id)
    end
    it '@artistの中身が期待通りであること' do
      expect(assigns(:artist)).to have_attributes(id: @artist.id)
    end
    it '@release_yearの中身が期待通りであること' do
      expect(assigns(:release_year)).to match(@release_year)
    end
    it '@postsの中身が期待通りであること' do
      @posts = select_posts(@posts)
      expect(assigns(:posts)).to match(sort_DESC(@posts))
    end
    it 'posts/new.html.hamlに遷移すること' do
      expect(response).to render_template :new
    end
  end
end
