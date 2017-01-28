FactoryGirl.define do

  factory :user do
    password 'supersecret'
  end

  factory :manufacturer do
    name {Faker::Company.name}
  end

  factory :product do
    model_number {"XYZ-#{rand(100000..999999)}"}
    height {rand(1..200)}
    weight {rand(5..25)}
    price {rand(1..100)*10_000}
    association :manufacturer, factory: :manufacturer
  end

  factory :robot do
    name {Faker::StarWars.droid}
    association :product, factory: :product
    in_stock false
    trait :on_order do
      in_stock false
    end
    trait :late do
      expected_date { Time.now - 7.days }
    end
  end
end
