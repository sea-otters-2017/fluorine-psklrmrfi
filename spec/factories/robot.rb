FactoryGirl.define do
  factory :robot do
    name Faker::StarWars.droid,
    in_stock [true, false].sample,
    product_id 1
  end
end
