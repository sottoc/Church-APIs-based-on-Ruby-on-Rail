require "spec_helper"

describe ConnectGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/connect_groups").should route_to("connect_groups#index")
    end

    it "routes to #new" do
      get("/connect_groups/new").should route_to("connect_groups#new")
    end

    it "routes to #show" do
      get("/connect_groups/1").should route_to("connect_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/connect_groups/1/edit").should route_to("connect_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/connect_groups").should route_to("connect_groups#create")
    end

    it "routes to #update" do
      put("/connect_groups/1").should route_to("connect_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/connect_groups/1").should route_to("connect_groups#destroy", :id => "1")
    end

  end
end
