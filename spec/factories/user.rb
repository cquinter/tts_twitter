FactoryBot.define do

  factory :user do
    name(Faker::Name.name)
    username(Faker::Internet.user_name)
    email(Faker::Internet.email)
    city(Faker::Address.city)
    state(Faker::Address.state)
    bio(Faker::Lorem.paragraph)
    password("123456")
    password_confirmation("123456")
  end

end
