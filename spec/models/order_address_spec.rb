require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'カード、住所情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
       expect(@order_address).to be_valid
    end

   it 'クレジットカード情報が空だと購入できないこと' do
     @order_address.token = nil
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Token can't be blank")
   end

    it 'postal_codeが空だと購入できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと購入できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと購入できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesは空だと購入できないこと' do
      @order_address.addresses = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it 'buildingは空でも購入できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it 'phone_numberは空だと購入できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end