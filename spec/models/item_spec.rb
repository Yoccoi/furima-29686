require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目の情報が存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが無いと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が無いと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品名説明が無いと保存できないこと' do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it 'カテゴリー情報が無いと保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it '商品の状態について情報がないと保存できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end
    it '配送料の負担について情報がないと保存できないこと' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
    end
    it '発送元の地域について情報がないと保存できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it '発送までの日数について情報がないと保存できないこと' do
      @item.days_for_shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days for shipping can't be blank", "Days for shipping is not a number")
    end
    it '価格がないと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が300円より安いと保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格が9,999,999円より高いと保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格が全角数字だと保存できないこと' do
      @item.price = '５０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

  end
end
