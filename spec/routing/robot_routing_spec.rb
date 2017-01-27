require "rails_helper"

RSpec.describe "Routing to robots", :type => :routing do
  it "routes GET /robots to robots#index" do
    expect(:get => "/robots").to route_to("robots#index")
  end

  it "routes GET /robots/new to robots#new" do
    expect(:get => "/robots/new").to route_to("robots#new")
  end

  it "routes GET /robots/1 to robots#show" do
    expect(:get => "/robots/1").to route_to("robots#show", :id => "1")
  end

  it "routes GET /robots/1/edit to robots#edit" do
    expect(:get => "/robots/1/edit").to route_to("robots#edit", :id => "1")
  end

  it "routes PUT /robots/1 to robots#update" do
    expect(:put => "/robots/1").to route_to("robots#update", :id => "1")
  end

  it "routes POST /robots to robots#create" do
    expect(:post => "/robots").to route_to("robots#create")
  end

  it "routes GET /robots/1/mark_received to robots#mark_received" do
    expect(:get => "/robots/1/mark_received").to route_to("robots#mark_received", :id => "1")
  end
end
