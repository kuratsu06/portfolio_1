FactoryBot.define do
  factory :purchase do
    association :user
    total_amount { 1 }
  end
end
