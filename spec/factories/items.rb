FactoryBot.define do
  factory :item do
    
    association :user

    title { Faker::Name.name }
    contents { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    product_status_id { Faker::Number.between(from: 2, to: 7 ) }
    shipping_charges_id { Faker::Number.between(from: 2, to: 3) }
    shipping_address_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
