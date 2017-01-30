require 'rails_helper'
require "#{Rails.root}/lib/utilities/robot_importer"

RSpec.describe RobotImporter, type: :helper do
  describe 'imports robots from API' do
    it 'populates the database with API data' do
      expect(Product.all.count).to eq(0)
      expect(Manufacturer.all.count).to eq(0)
      robot_url = "http://jordankamin.com/robots_api/robots.json"
      RobotImporter.import_from(api_url: robot_url)
      expect(Product.all.count).to_not eq(0)
      expect(Manufacturer.all.count).to_not eq(0)
    end
  end
end
