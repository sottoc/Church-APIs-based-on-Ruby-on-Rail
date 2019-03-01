class Podcast < ApplicationRecord
  
    attribute :podcast_file_path, :string
    attribute :podcast_size, :integer
  
    belongs_to :location
  
    include PodcastUploader::Attachment.new(:file) # adds a `file` virtual attribute  
  
    # This method associates the attribute ":source" with a file attachment
    has_attached_file :source
  
    default_scope{order(dateof: :desc)}
  
    validates :title, presence: true
    validates :author, presence: true
    validates :location_id, presence: true
    validates :dateof, presence: true
  
  def podcast_file_path
    if self.source.exists? 
      self.source
    elsif self.file
      self.file.url(public: true)
    end
  end
  
  def podcast_size
    if self.source.exists? 
       self.source.size 
    elsif self.file
      self.file.size
    else
    0
    end
  end
  end
  