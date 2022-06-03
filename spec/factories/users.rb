FactoryBot.define do
  factory :user do
    id { Faker::Number.number(digits: 10) }
    display_name { Faker::Name.name  }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end