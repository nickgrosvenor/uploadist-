class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :album_photos 
  has_many :ratings

  # has_attached_file :image, styles: { medium:"200x200" }

  has_attached_file :image,
      

  :storage => :s3,
  :bucket => ENV['S3_BUCKET_NAME'],
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }



end
