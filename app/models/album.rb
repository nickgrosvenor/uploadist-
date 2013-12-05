class Album < ActiveRecord::Base
  has_many :album_photos  
  belongs_to :user 

end
