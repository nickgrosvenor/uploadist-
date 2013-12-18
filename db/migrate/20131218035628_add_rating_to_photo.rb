class AddRatingToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :rating_amount, :integer
  end
end
