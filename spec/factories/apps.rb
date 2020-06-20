FactoryBot.define do
  factory :app do
    name { Faker::App.name }
    smtp_key { Faker::Alphanumeric.alpha(number: 10) }
    smtp_secret { Faker::Alphanumeric.alpha(number: 20) }
    smtp_address { Faker::Internet.url }
    smtp_port { 587 }
    smtp_authentication { :plain }
  end
end
