require "spec_helper"

describe AlbumPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/album_photos").should route_to("album_photos#index")
    end

    it "routes to #new" do
      get("/album_photos/new").should route_to("album_photos#new")
    end

    it "routes to #show" do
      get("/album_photos/1").should route_to("album_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/album_photos/1/edit").should route_to("album_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/album_photos").should route_to("album_photos#create")
    end

    it "routes to #update" do
      put("/album_photos/1").should route_to("album_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/album_photos/1").should route_to("album_photos#destroy", :id => "1")
    end

  end
end
