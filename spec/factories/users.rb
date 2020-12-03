FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    ppassword {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth                 {Faker::Date.birthday(min_age: 0, max_age: 120)}
    first_name            {"太郎"}
    last_name             {"山田"}
    kana_first            {"タロウ"}
    kana_family           {"ヤマダ"}
  end
end