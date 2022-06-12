require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
end

describe '商品の出品登録' do
  context '出品登録ができるとき' do
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@item).to be_valid
    end
  
    it 'カテゴリーが「---」以外であれば登録できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it '商品の状態が「---」以外であれば登録できる' do
      @item.product_status_id = 2
      expect(@item).to be_valid
    end
    it '配送料の負担が「---」以外であれば登録できる' do
      @item.shipping_address_id = 2
      expect(@item).to be_valid
    end
    it '発送元の地域が「---」以外であれば登録できる' do
      @item.shipping_charges_id = 2
      expect(@item).to be_valid
    end
    it '発送までの日数が「---」以外であれば登録できる' do
      @item.shipping_date_id = 2
      expect(@item).to be_valid
    end
    it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
  end

  context '出品ができないとき' do
    it 'ユーザー登録している人でないと出品できない' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
    it '１枚画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it '商品名が空欄だと出品できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it '商品の説明が空欄だと出品できない' do
      @item.contents = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Contents can't be blank"
    end
    it 'カテゴリーの情報が「---」だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it 'カテゴリーの情報が空欄だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態の情報が「---」だと出品できない' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Product status must be other than 1"
    end
    it '商品の状態の情報が空欄だと出品できない' do
      @item.product_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product status can't be blank"
    end
    it '配送料の負担の情報が「---」だと出品できない' do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charges must be other than 1"
    end
    it '配送料の負担の情報が空欄だと出品できない' do
      @item.shipping_charges_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charges can't be blank"
    end
    it '発送元の地域の情報が「---」だと出品できない' do
      @item.shipping_address_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping address must be other than 1"
    end
    it '発送元の地域の情報が空欄だと出品できない' do
      @item.shipping_address_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping address can't be blank"
    end
    it '発送までの日数の情報が「---」だと出品できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date must be other than 1"
    end
    it '発送までの日数の情報が空欄だと出品できない' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end
    it '価格が空欄だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
  end
end
end