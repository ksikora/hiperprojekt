require "spec_helper"

describe MonitoringAppsController do
  describe "routing" do

    it "routes to #index" do
      get("/monitoring_apps").should route_to("monitoring_apps#index")
    end

    it "routes to #new" do
      get("/monitoring_apps/new").should route_to("monitoring_apps#new")
    end

    it "routes to #show" do
      get("/monitoring_apps/1").should route_to("monitoring_apps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/monitoring_apps/1/edit").should route_to("monitoring_apps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/monitoring_apps").should route_to("monitoring_apps#create")
    end

    it "routes to #update" do
      put("/monitoring_apps/1").should route_to("monitoring_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/monitoring_apps/1").should route_to("monitoring_apps#destroy", :id => "1")
    end

  end
end
