FactoryBot.define do
  factory :review do
    association :user
    association :product
    comment { "MyText" }
  end
end
