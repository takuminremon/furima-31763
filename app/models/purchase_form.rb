class PurchaseForm
  include ActiveModel::Model
  attr_accessor  :token, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :item_id, :user_id

   with_options presence: true do
     validates :token
     validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
     validates :prefecture_id
     validates :municipality
     validates :house_number
     validates :phone_number, format: { with: /\A\d{10,11}\z/ }
     validates :item_id
     validates :user_id
   end

   extend ActiveHash::Associations::ActiveRecordExtensions
   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

   def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
   end
end
