class Item < ApplicationRecord


   belongs_to :user
   has_one :purchase
   has_one_attached :image

   with_options presence: true do
     validates :image
     validates :name 
     validates :explanation
   end

   validates :name,  length: { maximum: 40 }
   validates :explanation,  length: { maximum: 1000 }

   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :items_status
   belongs_to :delivery_fee
   belongs_to :area
   belongs_to :prefecture


    with_options numericality: { other_than: 1 } do
     validates :category_id
     validates :items_status_id
     validates :delivery_fee_id
     validates :area_id 
     validates :prefecture_id
     end

     validates :price, presence: true,
                numericality: {
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9_999_999,
                message: '¥300〜9,999,999の範囲で入力してください'
                 }
 end



