require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品等登録ができる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録ができない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が空では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が空では登録できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域の情報が空では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が空では登録できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10,000,000円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は全角では登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格は半角英字では登録できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐ついていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
