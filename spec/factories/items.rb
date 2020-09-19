FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.word }
    content               { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 10) }
    condition_id          { Faker::Number.between(from: 2, to: 7) }
    price                 { Faker::Number.within(range: 300..9999999) }
    shipping_fee_id       { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    days_for_shipping_id  { Faker::Number.between(from: 2, to: 4) }
    user_id               { 1 }
    
    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  
  end
end
