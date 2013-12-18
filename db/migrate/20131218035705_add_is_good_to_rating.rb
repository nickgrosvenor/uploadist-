class AddIsGoodToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :is_good, :boolean
  end
end
