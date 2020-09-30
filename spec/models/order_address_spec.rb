require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'カード、住所情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_address).to be_valid
    end

    it 'buildingは空でも購入できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it 'クレジットカード情報が空だと購入できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
    end

    it 'postal_codeが空だと購入できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を含んで入力してください')
    end

    it 'prefectureを選択していないと購入できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
    end

    it 'cityが空だと購入できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
    end

    it 'addressesは空だと購入できないこと' do
      @order_address.addresses = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('番地を入力してください')
    end

    it 'phone_numberは空だと購入できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
    end

    it 'phone_numberはハイフンがあり、12桁以上だと購入できないこと' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は11桁以内で入力してください')
    end
  end
end
