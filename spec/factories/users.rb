FactoryBot.define do
  factory :user do
   
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'陸太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birth_date            {Faker::Date.backward}
  end
end