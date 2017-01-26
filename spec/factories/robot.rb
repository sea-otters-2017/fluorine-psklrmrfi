FactoryGirl.define do
  factory :robot do
    name Faker::StarWars.droid
    product_id 1
    in_stock false
    trait :on_order do
      in_stock false
    end
  end
end
