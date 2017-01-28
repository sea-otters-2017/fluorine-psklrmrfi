# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "#{Rails.root}/lib/utilities/robot_importer"

# Robot.delete_all
# Product.delete_all
# Manufacturer.delete_all

robot_url = "http://jordankamin.com/robots_api/robots.json"
RobotImporter.import_at_interval(api_url: robot_url, interval: 120)

# 20.times do |n|
#   Robot.create!(  name: Faker::StarWars.droid,
#                   in_stock: [true, false].sample,
#                   product_id: Product.all.sample.id )
# end
