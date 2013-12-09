class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :album_photos 
  belongs_to :rating 
end
