FactoryBot.define do
  factory :order do
    association :product
    association :purchase
    quantity { 1 }
    subtotal { 1 }
  end
end
