require 'rails_helper'
 RSpec.describe Item, type: :model do
   before do
     @item = FactoryBot.build(:item)
   end

   describe '商品出品' do
     context '商品登録がうまくいくとき' do
       it '画像,商品名,商品情報,価格,が存在し、カテゴリー,状態,配送料,県,配送予定が１以外であれば登録できる' do
         expect(@item).to be_valid
       end
       it 'nameが40文字以下で登録できる' do
         @item.name = Faker::Name.initials(number: 40)
         expect(@item).to be_valid
       end
       it 'explanationが1000文字以下で登録できる' do
         @item.explanation = Faker::Name.initials(number: 1000)
         expect(@item).to be_valid
       end
       it 'priceが300以上で登録できる' do
         @item.price = '300'
         expect(@item).to be_valid
       end
       it 'priceが9,999,999以下で登録できる' do
         @item.price = '9999999'
         expect(@item).to be_valid
       end
     end

     context '商品登録がうまくいかないとき' do
       it 'imageが空では登録できない' do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
       end
       it 'nameが空では登録できない' do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
       end
       it 'nameが40文字以上では登録できない' do
         @item.name = Faker::Name.initials(number: 41)
         @item.valid?
         expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
       end
       it 'explanationが空では登録できない' do
         @item.explanation = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Explanation can't be blank")
       end
       it 'explanationが1000文字以上では登録できない' do
         @item.explanation = Faker::Name.initials(number: 1001)
         @item.valid?
         expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
       end
       it 'category_idが１では登録できない' do
         @item.category_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Category must be other than 1")
       end
       it 'items_status_idが１では登録できない' do
         @item.items_status_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Items status must be other than 1")
       end
       it 'delivery_fee_idが１では登録できない' do
         @item.delivery_fee_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
       end
       it 'prefecture_idが１では登録できない' do
         @item.prefecture_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
       end
       it 'area_idが１では登録できない' do
         @item.area_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Area must be other than 1")
       end
       it 'priceが空では登録できない' do
         @item.price = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Price can't be blank")
       end
       it 'priceが300以下では登録できない' do
         @item.price = '299'
         @item.valid?
         expect(@item.errors.full_messages).to include("Price ¥300〜9,999,999の範囲で入力してください")
       end
       it 'priceが9,999,999以上では登録できない' do
         @item.price = '10000000'
         @item.valid?
         expect(@item.errors.full_messages).to include("Price ¥300〜9,999,999の範囲で入力してください")
       end
     end
   end
 end
