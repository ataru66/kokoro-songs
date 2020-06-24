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
        it 'nameカラムが一意的だと保存できること' do
          create(:user)
          @user.valid?
          expect(@user).to be_valid
        end

        it 'emailカラムが一意的だと保存できること' do
          create(:user)
          @user.valid?
          expect(@user).to be_valid
        end
      end
      context '保存できない場合' do
        it 'nameカラムが一意的じゃないと保存できないこと' do
          first_user = create(:user)
          @user.name = first_user.name
          @user.valid?
          expect(@user.errors[:name]).to include("has already been taken")
        end

        it 'emailカラムが一意的じゃないと保存できないこと' do
          first_user = create(:user)
          @user.email = first_user.email
          @user.valid?
          expect(@user.errors[:email]).to include("has already been taken")
        end
      end
    end
  end
end
