require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    before do
      @user = build(:user)
    end
    describe 'presence: true' do
      context '保存できる場合' do
        it 'nameカラムにデータがあると保存できること' do
          @user.valid?
          expect(@user).to be_valid
        end
        it 'emailカラムにデータがあると保存できること' do
          @user.valid?
          expect(@user).to be_valid
        end
      end
      context '保存できない場合' do
        it 'nameカラムが空だと保存できないこと' do
          @user.name = ""
          @user.valid?
          expect(@user.errors[:name]).to include("can't be blank")
        end

        it 'emailカラムが空だと保存できないこと' do
          @user.email = ""
          @user.valid?
          expect(@user.errors[:email]).to include("can't be blank")
        end
      end
    end
    describe 'uniqueness: true' do
      context '保存できる場合' do
      end
      context '保存できない場合' do
      end
    end
  end
end
