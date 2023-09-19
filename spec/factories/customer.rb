FactoryBot.define do
  factory :customer, aliases: [:user] do

    # atributo transitório
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    #email { Faker::Internet.email }
    # usando sequence
    sequence(:email) { |n| "meu_email_#{n}@email.com" }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end