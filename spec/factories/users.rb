FactoryBot.define do
  factory :user do |u|
    u.id { Faker::Number.number(digits: 10) }
    u.display_name { Faker::Name.name }
    u.email { Faker::Internet.free_email }
    #u.password { Faker::Internet.password(min_length: 8) }
    #u.password_confirmation { password }
    u.password { "password" }
    u.password_confirmation { "password" }
  end
end