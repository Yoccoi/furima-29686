FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '山田'}
    last_name  {'陸太郎'}
    first_name_kana {'ヤマダ'}
    last_name_kana {'リクタロウ'}
    birth_date { Faker::Date.in_date_period }
  end
end
