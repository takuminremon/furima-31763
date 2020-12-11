FactoryBot.define do
  factory :purchase_form do
    token { 'tok_50fd39aa8dd2aabb56b8c511b2b9' }
     postal_code { '123-4567' }
     prefecture_id { 2 }
     municipality { '札幌市' }
     house_number { '一番街1-1' }
     building { '札幌ビル' }
     phone_number { '01234567890' }
  end
end
