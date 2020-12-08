FactoryBot.define do
  factory :user_order do
    postal_code              {'111-1111' }
    prefecture_id            { Faker::Number.between(from: 2, to: 48) }
    city                     { Faker::Address.city }
    address                  { Faker::Address.street_address }
    building_name            { Faker::Lorem.sentence }
    phone_number             { '11111111111' }
    token                    {'1111111111111111' }
  end
end
