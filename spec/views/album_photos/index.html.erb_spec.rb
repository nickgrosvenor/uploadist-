require 'spec_helper'

describe "album_photos/index" do
  before(:each) do
    assign(:album_photos, [
      stub_model(AlbumPhoto,
        :photo => nil,
        :album => nil,
        :user => nil
      ),
      stub_model(AlbumPhoto,
        :photo => nil,
        :album => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of album_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
