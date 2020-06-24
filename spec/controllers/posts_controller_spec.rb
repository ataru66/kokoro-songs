require 'rails_helper'
require 'rspotify'
RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

describe PostsController do
  def sort_DESC(posts)
    posts.sort{|a, b| b.updated_at <=> a.updated_at}
  end

  def select_posts(posts, artist, song)
    posts.select{|post| post.artist_id == artist&.id && post.song_id == song&.id}
  end

  describe 'GET #index' do
    it '@postsの値が期待通りであること' do
      posts = create_list(:post, 5)
      get :index
      expect(assigns(:posts)).to match(sort_DESC(posts))
    end
    it 'posts/index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      params = { song_id: "58dxGXavrcagRqA58fNB0Z", artist_id: "5Vo1hnCRmCM6M4thZCInCj" }
      @song = RSpotify::Track.find(params[:song_id])
      @artist = @song.artists[0]
      @release_year = @song.album.release_date.gsub(/-.+/, "")
      @posts = create_list(:post, 3)
      get :new, params: params
    end
    it '@songの値が期待通りであること' do
      expect(assigns(:song)).to have_attributes(id: @song.id)
    end
    it '@artistの値が期待通りであること' do
      expect(assigns(:artist)).to have_attributes(id: @artist.id)
    end
    it '@release_yearの値が期待通りであること' do
      expect(assigns(:release_year)).to match(@release_year)
    end
    it '@postsの値が期待通りであること' do
      @posts = select_posts(@posts, @artist, @song)
      expect(assigns(:posts)).to match(sort_DESC(@posts))
    end
    it 'posts/new.html.hamlに遷移すること' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    def create_action(params)
      post :create, params: params
    end
    context 'ログインしている場合' do
      before(:each) do
        login_user
        @params = {
          post: {
            content: "hello world",
            song_id: "58dxGXavrcagRqA58fNB0Z",
            artist_id: "5Vo1hnCRmCM6M4thZCInCj",
            song: "Pretender",
            artist: "Official HIGE DANdism"
          }
        }
      end
      it 'postをDBに保存できること' do
        expect{ create_action(@params) }.to change{ Post.count }.by(1)
      end
      it 'posts/new.html.hamlにリダイレクトすること' do
        create_action(@params)
        expect(response).to redirect_to("http://test.host/posts/new?song_id=58dxGXavrcagRqA58fNB0Z")
      end
    end
    context 'ログインしていない場合' do
      it 'devise/sessions/new.html.hamlへリダイレクトすること' do
        create_action(@params)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインしている場合' do
      before do
        login_user
        post = create(:post, user_id: @login_user.id)
        params = { id: post.id }
        @song = RSpotify::Track.find(post.song_id)
        @artist = @song.artists[0]
        @release_year = @song.album.release_date.gsub(/-.+/, "")
        get :edit, params: params
      end
      it '@songの値が期待通りであること' do
        expect(assigns(:song)).to have_attributes(id: @song.id)
      end
      it '@artistの値が期待通りであること' do
        expect(assigns(:artist)).to have_attributes(id: @artist.id)
      end
      it '@release_yearの値が期待通りであること' do
        expect(assigns(:release_year)).to match(@release_year)
      end
      it 'posts/edit.html.hamlに遷移すること' do
        expect(response).to render_template :edit
      end
    end
    context 'ログインしていない場合' do
      it 'devise/sessions/new.html.hamlへリダイレクトすること' do
        post = create(:post)
        params = {id: post.id}
        get :edit, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do
    context 'ログインしている場合' do
      before(:each) do
        login_user
        @post = create(:post, user_id: @login_user.id)
        params = {
          id: @post.id,
          post: {
            content: "hello world",
            song_id: "58dxGXavrcagRqA58fNB0Z",
            artist_id: "5Vo1hnCRmCM6M4thZCInCj",
            song: "Pretender",
            artist: "Official HIGE DANdism"
          }
        }
        patch :update, params: params
      end
      it '@postの値が期待通りであること' do
      end
      it 'データの更新ができること' do
      end
      it 'posts/new.html.hamlに遷移すること' do
      end
    end
    context 'ログインしていない場合' do
      it 'devise/sessions/new.html.hamlへリダイレクトすること' do
      end
    end
  end
end
