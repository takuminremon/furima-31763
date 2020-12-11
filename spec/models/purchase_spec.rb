require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:purchase_form)
    end
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @item_purchase.building = nil
        expect(@item_purchase).to be_valid
      end
    end
    
    context '商品登録がうまくいかないとき' do
      it 'クレジットカードの情報を正しく入力しないと保存できないこと' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_purchase.postal_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @item_purchase.municipality = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @item_purchase.house_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁か11桁の正しい形式でないと保存できないこと' do
        @item_purchase.phone_number = '123456789'
         @item_purchase.valid?
         expect(@item_purchase.errors.full_messages).to include('Phone number is invalid')
       end
       it 'user_idがないと登録できないこと' do
         @item_purchase.user_id = nil
         @item_purchase.valid?
         expect(@item_purchase.errors.full_messages).to include("User can't be blank")

       end
       it 'item_idがないと登録できないこと' do
         @item_purchase.item_id = nil
         @item_purchase.valid?
         expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
       end
     end
   end
end
