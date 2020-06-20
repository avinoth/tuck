FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.word }
  end
end
