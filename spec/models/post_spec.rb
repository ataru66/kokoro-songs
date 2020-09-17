require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    before do
      @user = create(:user)
      artist = create(:artist)
      album = create(:album)
      track = create(:track)
      artists_album = create(:artists_album)
      artists_track = create(:artists_track)
      @post = build(:post)
    end

    context '保存できない場合' do

      it 'contentカラムが空だと保存できないこと' do
        @post.content = ""
        @post.valid?
        expect(@post.errors[:content]).to include("can't be blank")
      end

      # it 'artist_idカラムが空だと保存できないこと' do
      #   @post.artist_id = ""
      #   @post.valid?
      #   expect(@post.errors[:artist_id]).to include("can't be blank")
      # end

      # it 'song_idカラムが空だと保存できないこと' do
      #   @post.song_id = ""
      #   @post.valid?
      #   expect(@post.errors[:song_id]).to include("can't be blank")
      # end

      # it 'artistカラムが空だと保存できないこと' do
      #   @post.artist = ""
      #   @post.valid?
      #   expect(@post.errors[:artist]).to include("can't be blank")
      # end

      # it 'songカラムが空だと保存できないこと' do
      #   @post.song = ""
      #   @post.valid?
      #   expect(@post.errors[:song]).to include("can't be blank")
      # end
    end

    context '保存できる場合' do

      # it 'contentカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'artist_idカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'song_idカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'artistカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'songカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end
    end
  end

  describe 'NotNull制約' do
    before do
      @user = create(:user)
      @post = build(:post)
    end

    context '保存できない場合' do

      # it 'contentカラムがnullだと保存できないこと' do
      #   @post.content = nil
      #   @post.valid?
      #   expect(@post.errors[:content]).to include("can't be blank")
      # end

      # it 'artist_idカラムがnullだと保存できないこと' do
      #   @post.artist_id = nil
      #   @post.valid?
      #   expect(@post.errors[:artist_id]).to include("can't be blank")
      # end

      # it 'song_idカラムがnullだと保存できないこと' do
      #   @post.song_id = nil
      #   @post.valid?
      #   expect(@post.errors[:song_id]).to include("can't be blank")
      # end

      # it 'artistカラムがnullだと保存できないこと' do
      #   @post.artist = nil
      #   @post.valid?
      #   expect(@post.errors[:artist]).to include("can't be blank")
      # end

      # it 'songカラムがnullだと保存できないこと' do
      #   @post.song = nil
      #   @post.valid?
      #   expect(@post.errors[:song]).to include("can't be blank")
      # end
    end

    context '保存できる場合' do

      # it 'contentカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'artist_idカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'song_idカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'artistカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end

      # it 'songカラムにデータがあると保存できること' do
      #   @post.valid?
      #   expect(@post).to be_valid
      # end
    end
  end
end
