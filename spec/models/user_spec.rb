require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が埋まっていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "passwordが5文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)","Password is invalid"
      end
      it "パスワードと確認パスワードは値が一致が必須であること。" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is invalid"
      end
       
      

      it "nicknameがない場合は登録できないこと" do 
        @user.nickname = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "重複したemailは登録できない" do
        @user.email = 'test@com'
        @user.email = 'test@com'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      
      it "emailに@を含まない場合は登録できない" do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end


      it "passwordがない場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      
    
      it "英字のみのパスワードでは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

    it "数字のみのパスワードでは登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

     it "全角文字を含むパスワードでは登録できない" do
      @user.password = '12うabc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

      it "encrypted_passwordがない場合は登録できないこと" do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it "family_nameがない場合は登録できないこと" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'family_nameが全角入力でなければ登録できないこと' do
        @user.family_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end


      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      
      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.family_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end

      it "family_name_kanaがない場合は登録できないこと" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "birth_dateがない場合は登録できないこと" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end