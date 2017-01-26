require "rails_helper"

RSpec.describe "Routing to robots", :type => :routing do
  it "routes GET /robots to robots#index" do
    expect(:get => "/robots").to route_to("robots#index")
  end

end
