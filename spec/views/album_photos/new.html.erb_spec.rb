require 'spec_helper'

describe "album_photos/new" do
  before(:each) do
    assign(:album_photo, stub_model(AlbumPhoto,
      :photo => nil,
      :album => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new album_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", album_photos_path, "post" do
      assert_select "input#album_photo_photo[name=?]", "album_photo[photo]"
      assert_select "input#album_photo_album[name=?]", "album_photo[album]"
      assert_select "input#album_photo_user[name=?]", "album_photo[user]"
    end
  end
end
