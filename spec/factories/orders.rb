FactoryBot.define do
  factory :order do
    product { nil }
    purchase { nil }
    quantity { 1 }
    subtotal { 1 }
  end
end
