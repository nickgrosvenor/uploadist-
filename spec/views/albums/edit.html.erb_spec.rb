require 'spec_helper'

describe "albums/edit" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :user => nil,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", album_path(@album), "post" do
      assert_select "input#album_user[name=?]", "album[user]"
      assert_select "input#album_name[name=?]", "album[name]"
      assert_select "input#album_url[name=?]", "album[url]"
    end
  end
end
