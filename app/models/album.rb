class Album < ActiveRecord::Base
  default_scope order('created_at DESC')
 
 # # Environment-specific direct upload url verifier screens for malicious posted upload locations.
 #  DIRECT_UPLOAD_URL_FORMAT = %r{\Ahttps:\/\/s3-us-west-2\.amazonaws\.com\/uploadist\/(?<filepath>uploads\/.+\/(?<filename>.+))\z}.freeze
 # # https://s3-us-west-2.amazonaws.com/uploadist/uploads%2F1386814274254-16hda061d84r6bt9-86404601a344c663ad17c4eda70f4403%2FNick%2BGrosvenor%2BKatie%2BLaBarge%2BLCDQ%2BLa%2BCienega%2BRigZnefelABl.jpg
  belongs_to :user
  has_many :album_photos
  has_many :photos, through: :album_photos, source: :photo
 #  # validates :direct_upload_url, presence: true, format: { with: DIRECT_UPLOAD_URL_FORMAT }
    
 #  before_create :set_upload_attributes
 #  after_create :queue_processing
  
  
 #  # Store an unescaped version of the escaped URL that Amazon returns from direct upload.
 #  def direct_upload_url=(escaped_url)
 #    write_attribute(:direct_upload_url, (CGI.unescape(escaped_url) rescue nil))
 #  end
  
 #  # Determines if file requires post-processing (image resizing, etc)
 #  def post_process_required?
 #    %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}.match(upload_content_type).present?
 #  end
  
 #  # Final upload processing step
 #  def self.transfer_and_cleanup(id)
 #    album = Album.find(id)
 #    direct_upload_url_data = DIRECT_UPLOAD_URL_FORMAT.match(album.direct_upload_url)
 #    s3 = AWS::S3.new
    
 #    if album.post_process_required?
 #      album.upload = URI.parse(URI.escape(album.direct_upload_url))
 #    else
 #      paperclip_file_path = "albums/uploads/#{id}/original/#{direct_upload_url_data[:filename]}"
 #      s3.buckets[Rails.configuration.aws[:bucket]].objects[paperclip_file_path].copy_from(direct_upload_url_data[:filepath])
 #    end
 
 #    album.processed = true
 #    album.save
    
 #    s3.buckets[Rails.configuration.aws[:bucket]].objects[direct_upload_url_data[:filepath]].delete
 #  end
      
 #  private
  
 #  # Set attachment attributes from the direct upload
 #  # @note Retry logic handles S3 "eventual consistency" lag.
 #  def set_upload_attributes
 #    tries ||= 5
 #    direct_upload_url_data = DIRECT_UPLOAD_URL_FORMAT.match(direct_upload_url)
 #    s3 = AWS::S3.new
 #    direct_upload_head = s3.buckets[Rails.configuration.aws[:bucket]].objects[direct_upload_url_data[:filepath]].head
 
 #    self.upload_file_name     = direct_upload_url_data[:filename]
 #    self.upload_file_size     = direct_upload_head.content_length
 #    self.upload_content_type  = direct_upload_head.content_type
 #    self.upload_updated_at    = direct_upload_head.last_modified

 #  rescue AWS::S3::Errors::NoSuchKey => e
 #    tries -= 1
 #    if tries > 0
 #      sleep(3)
 #      retry
 #    else
 #      false
 #    end
 #  end
  
 #  # Queue file processing
 #  def queue_processing
 #    Album.delay.transfer_and_cleanup(id)
 #  end
 
end