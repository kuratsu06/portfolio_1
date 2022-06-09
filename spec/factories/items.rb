FactoryBot.define do
  factory :item do
    association :product
    association :cart
    quantity { 1 }
  end
end
