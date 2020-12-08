FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.sentence }
    description                 { Faker::Lorem.sentence }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    condition_id                { Faker::Number.between(from: 2, to: 6) }
    delivery_fee_id             { Faker::Number.between(from: 2, to: 4) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    day_to_delivery_id          { Faker::Number.between(from: 2, to: 3) }
    value                       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
