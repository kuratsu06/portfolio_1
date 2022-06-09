FactoryBot.define do
  factory :product do
    association :category
    name { "MyString" }
    price { 1 }
    description { "MyText" }

    after(:build) do |product|
      product.images << FactoryBot.build(:image, product_id: product.id)
    end
  end

  factory :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png') }
  end
end
