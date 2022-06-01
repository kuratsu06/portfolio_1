FactoryBot.define do
  factory :review do
    user { nil }
    product { nil }
    comment { "MyText" }
  end
end
