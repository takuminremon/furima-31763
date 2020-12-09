FactoryBot.define do
  factory :item do
        name                     { Faker::Name.initials(number: 5) }
        explanation                     { Faker::Lorem.sentence }
        category_id              { 2 }
        items_status_id          { 2 }
        delivery_fee_id          { 2 }
        prefecture_id            { 2 }
        area_id                  { 2 }
        price                    { Faker::Number.number(digits: 7) }
        association :user

        after(:build) do |message|
          message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end
   end
end
