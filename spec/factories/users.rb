FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    kana_first            {"タロウ"}
    kana_family           {"ヤマダ"}
    birth                 {aker::Date.birthday(min_age: 0, max_age: 100)}
  end
end
