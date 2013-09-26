FactoryGirl.define do
  factory :product do
    sequence(:price) {|n| n + 1 }
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    sequence(:image_url) {|n| "#{n}_img.png" }
  end
end