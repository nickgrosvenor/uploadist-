require 'spec_helper'

describe "album_photos/edit" do
  before(:each) do
    @album_photo = assign(:album_photo, stub_model(AlbumPhoto,
      :photo => nil,
      :album => nil,
      :user => nil
    ))
  end

  it "renders the edit album_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", album_photo_path(@album_photo), "post" do
      assert_select "input#album_photo_photo[name=?]", "album_photo[photo]"
      assert_select "input#album_photo_album[name=?]", "album_photo[album]"
      assert_select "input#album_photo_user[name=?]", "album_photo[user]"
    end
  end
end
