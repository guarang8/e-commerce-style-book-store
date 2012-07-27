require "spec_helper"

describe Admin::BooksController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_books").should route_to("admin_books#index")
    end

    it "routes to #new" do
      get("/admin_books/new").should route_to("admin_books#new")
    end

    it "routes to #show" do
      get("/admin_books/1").should route_to("admin_books#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_books/1/edit").should route_to("admin_books#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_books").should route_to("admin_books#create")
    end

    it "routes to #update" do
      put("/admin_books/1").should route_to("admin_books#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_books/1").should route_to("admin_books#destroy", :id => "1")
    end

  end
end
