require 'spec_helper'

describe "ratings/edit" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating,
      :user_id => 1,
      :photo_id => 1
    ))
  end

  it "renders the edit rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do
      assert_select "input#rating_user_id[name=?]", "rating[user_id]"
      assert_select "input#rating_photo_id[name=?]", "rating[photo_id]"
    end
  end
end
