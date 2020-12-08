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
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が1だと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空だと購入できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it ' 電話番号が空だと購入できない' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
