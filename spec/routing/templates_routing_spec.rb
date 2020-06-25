require "rails_helper"

RSpec.describe TemplatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/apps/1/templates").to route_to("templates#index", app_id: "1")
    end

    it "routes to #new" do
      expect(get: "/apps/1/templates/new").to route_to("templates#new", app_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/apps/1/templates/1/edit").to route_to("templates#edit", id: "1", app_id: "1")
    end

    it "routes to #create" do
      expect(post: "/apps/1/templates").to route_to("templates#create", app_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/apps/1/templates/1").to route_to("templates#update", id: "1", app_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/apps/1/templates/1").to route_to("templates#update", id: "1", app_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/apps/1/templates/1").to route_to("templates#destroy", id: "1", app_id: "1")
    end
  end
end
