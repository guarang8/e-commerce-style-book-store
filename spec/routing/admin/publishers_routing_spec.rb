require "spec_helper"

describe Admin::PublishersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_publishers").should route_to("admin_publishers#index")
    end

    it "routes to #new" do
      get("/admin_publishers/new").should route_to("admin_publishers#new")
    end

    it "routes to #show" do
      get("/admin_publishers/1").should route_to("admin_publishers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_publishers/1/edit").should route_to("admin_publishers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_publishers").should route_to("admin_publishers#create")
    end

    it "routes to #update" do
      put("/admin_publishers/1").should route_to("admin_publishers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_publishers/1").should route_to("admin_publishers#destroy", :id => "1")
    end

  end
end
