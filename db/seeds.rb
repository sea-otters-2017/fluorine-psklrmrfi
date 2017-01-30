# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "#{Rails.root}/lib/utilities/robot_importer"
require 'faker'

Robot.delete_all
Product.delete_all
Manufacturer.delete_all
User.delete_all

robot_url = "http://jordankamin.com/robots_api/robots.json"
RobotImporter.import_from(api_url: robot_url)

10.times do |n|
  robot = Robot.create!(  name: Faker::StarWars.droid,
                  in_stock: true,
                  available: [true, false].sample,
                  product_id: Product.all.sample.id )
  robot.expected_date = Time.now + rand(-7..21).days
  robot.save
end

10.times do |n|
  robot = Robot.create!(  name: Faker::StarWars.droid,
                  in_stock: false,
                  available: false,
                  product_id: Product.all.sample.id )
  robot.expected_date = Time.now + rand(-7..21).days
  robot.save
end

User.create!(password: '123')
