class AlbumPhoto < ActiveRecord::Base
  belongs_to :photo
  belongs_to :album
  belongs_to :user
end
