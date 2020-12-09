require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、姓と名の漢字とカタカナ、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに＠が含まれていなければ登録できない' do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字だけであれば登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが英語だけであれば登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角であれば登録できない' do
        @user.password = 'ABCD１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー本名の名はアルファベットだと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）名は不正な値です")
      end
      it 'ユーザー本名の姓はアルファベットだと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）姓は不正な値です")
      end
      it 'ユーザー本名の名が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）名を入力してください")
      end
      it 'ユーザー本名の姓が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）姓を入力してください")
      end
      it 'ユーザー本名の姓のフリガナはアルファベットだと登録できない' do
        @user.kana_family = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）セイは不正な値です")
      end
      it 'ユーザー本名の名のフリガナはアルファベットだと登録できない' do
        @user.kana_first = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）メイは不正な値です")
      end
      it 'ユーザーのフリガナの姓が空だと登録できない' do
        @user.kana_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）セイを入力してください")
      end
      it 'ユーザー本名のフリガナの名が空だと登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）メイを入力してください")
      end
      it '生年月日が空だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
