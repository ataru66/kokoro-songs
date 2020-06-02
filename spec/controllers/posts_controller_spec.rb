require 'rails_helper'

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
end
