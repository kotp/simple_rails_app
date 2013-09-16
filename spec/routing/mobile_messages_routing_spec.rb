require "spec_helper"

describe MobileMessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/mobile_messages").should route_to("mobile_messages#index")
    end

    it "routes to #new" do
      get("/mobile_messages/new").should route_to("mobile_messages#new")
    end

    it "routes to #show" do
      get("/mobile_messages/1").should route_to("mobile_messages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mobile_messages/1/edit").should route_to("mobile_messages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mobile_messages").should route_to("mobile_messages#create")
    end

    it "routes to #update" do
      put("/mobile_messages/1").should route_to("mobile_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mobile_messages/1").should route_to("mobile_messages#destroy", :id => "1")
    end

  end
end
