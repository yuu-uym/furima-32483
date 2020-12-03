require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、姓と名の漢字とカタカナ、誕生日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていなければ登録できない" do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけであれば登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英語だけであれば登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角であれば登録できない" do
        @user.password = 'あいうえおかきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名の名はアルファベットだと登録できない"do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名の姓はアルファベットだと登録できない"do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "ユーザー本名の名が空だと登録できない"do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の姓が空だと登録できない"do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名の名のフリガナはアルファベットだと登録できない"do
        @user.kana_family = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family is invalid")
      end
      it "ユーザー本名の姓のフリガナはアルファベットだと登録できない"do
        @user.kana_first = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it "ユーザーのフリガナの姓が空だと登録できない"do
        @user.kana_family = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family can't be blank")
      end
      it "ユーザー本名のフリガナの名が空だと登録できない"do
        @user.kana_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it "生年月日が空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end