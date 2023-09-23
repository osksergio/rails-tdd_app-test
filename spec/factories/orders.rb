FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order number - #{n}" }
    customer
  end
end
