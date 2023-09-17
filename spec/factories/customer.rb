FactoryBot.define do
  factory :customer, aliases: [:user] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    vip { true }
    days_to_pay { 30 }
  end
end