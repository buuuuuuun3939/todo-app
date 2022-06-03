FactoryBot.define do
  factory :user_update do
    id { Faker::Number.number(digits: 10) }
    display_name { Faker::Name.name  }
    email { Faker::Internet.free_email }
    old_password {}
    password { '12345678' }
    password_confirmation {password}
  end
end