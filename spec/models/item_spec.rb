require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test.jpeg')
  end

  describe '出品登録' do
    context '出品登録がうまくいくとき' do
      it 'image、name、description、category_id、condition_id、delivery_fee_id、prefecture_id、day_to_delivery_id、 valueが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_id が１だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'delivery_fee_idが１だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'prefecture_idが１だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'day_to_delivery_idが１だと登録できない' do
        @item.day_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to delivery must be other than 1')
      end
      it 'value が空だと登録できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it 'value が300未満だと登録できない' do
        @item.value = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Value must be greater than 299')
      end
      it 'value が10,000,000以上だと登録できない' do
        @item.value = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Value must be less than 10000000')
      end
      it 'value が全角だと登録できない' do
        @item.value = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not a number')
      end
    end
  end
end
