FactoryBot.define do
  factory :template do
    name { Faker::Lorem.word }
    content { "<h1>Hello</h1>" }
    app
  end
end
