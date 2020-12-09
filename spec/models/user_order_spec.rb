require 'rails_helper'
describe UserOrder do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '購入' do
    context '購入がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@user_order).to be_valid
      end
      it 'building_name が空でも、商品の購入ができる' do
        @user_order.building_name = ''
        expect(@user_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("カード情報を入力してください")
      end
      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '都道府県が1だと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it '市区町村が空だと購入できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できない' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("番地を入力してください")
      end
      it ' 電話番号が空だと購入できない' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it ' 電話番号にハイフンがあると購入できない' do
        @user_order.phone_number = '123-456-789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
