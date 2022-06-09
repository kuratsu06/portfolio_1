FactoryBot.define do
  factory :user do
    name { "MyString" }
    address { "MyString" }
    phone { 1 }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
