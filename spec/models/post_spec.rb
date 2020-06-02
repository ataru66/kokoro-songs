require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    before do
      @user = create(:user)
      @post = build(:post)
    end

    context '保存できない場合' do

    end

    context '保存できる場合' do

    end
  end

end
