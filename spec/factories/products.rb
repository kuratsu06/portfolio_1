FactoryBot.define do
  factory :product do
    category { nil }
    name { "MyString" }
    price { 1 }
    description { "MyText" }
  end
end
