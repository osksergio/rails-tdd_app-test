FactoryBot.define do
  factory :customer, aliases: [:user] do

    # atributo transitório
    transient do
      upcased { false }
      qtt_orders { 3 }
    end

    name { Faker::Name.name }
    #email { Faker::Internet.email }
    # usando sequence
    sequence(:email) { |n| "meu_email_#{n}@email.com" }

    address { Faker::Address.street_address }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end