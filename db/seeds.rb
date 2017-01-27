# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Robot.delete_all
Product.delete_all
Manufacturer.delete_all

10.times do |n|
  Manufacturer.create!(name: Faker::Company.name)
end

20.times do |n|
  Product.create!(  model_number: "XYZ-#{rand(100000..999999)}",
                    height: rand(1..200),
                    weight: rand(5..25),
                    manufacturer_id: Manufacturer.all.sample.id )
end

20.times do |n|
  Robot.create!(  name: Faker::StarWars.droid,
                  in_stock: [true, false].sample,
                  product_id: Product.all.sample.id )
end
# robot_url = "http://jordankamin.com/robots_api/robots.json"
# RobotImporter.import_from(api_url: robot_url)
