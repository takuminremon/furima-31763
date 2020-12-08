FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name        {Gimei.first.kanji}
    first_name_kana   {Gimei.first.katakana}  
    last_name         {Gimei.last.kanji}
    last_name_kana    {Gimei.last.katakana}       
    birthday {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end