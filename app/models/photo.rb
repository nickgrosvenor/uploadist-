class Photo < ActiveRecord::Base
  has_many :album_photos
  has_many :ratings 
  belongs_to :user
end
