class Location < ApplicationRecord

	has_many :events
	has_many :connect_groups
	has_many :podcasts

	geocoded_by :full_address
	after_validation :geocode, if: :address_changed?
	validates :pastor_name, presence: true
	validates :day, presence: true
	validates :times, presence: true
	validates :welcome, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :province, presence: true
	validates :phone, presence: true
	validates :facebook, presence: true
	validates :twitter, presence: true
	validates :instagram, presence: true
	validates :slug, presence: true
  before_validation :create_slug

	has_attached_file :photo,
	styles: {
  	icon: '40>',
    thumb: '100x100>',
    square: '200x200#',
    desktop: '300x300#',
    medium: '300x300>',
    mobileFeature: '800x400>#',
    slider: '1600x700>#'
  }, default_url: "logo_no_name.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	has_attached_file :logo,
	styles: lambda {|attachment| attachment.instance.svg? ? {} : {
  	icon: '40>',
    thumb: '100x100>',
    square: '200x200#',
    desktop: '300x300#',
    medium: '300x300>',
  }},
	processors: lambda {|instance| instance.svg? ? [] : [:thumbnail]},
	 default_url: "logo_no_name.png"

  validates_attachment :logo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/svg+xml"] }

	has_attached_file :inline_logo,
	styles: lambda {|attachment| attachment.instance.svg? ? {} : {
  	icon: '40>',
    thumb: '100x100>',
    square: '200x200#',
    desktop: '300x300#',
    medium: '300x300>',
  }},
	processors: lambda {|instance| instance.svg? ? [] : [:thumbnail]},
	 default_url: "logo_no_name.png"

  validates_attachment :inline_logo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/svg+xml"] }


	has_attached_file :pastor_signature,
	styles: {
    thumb: '100x100>',
    square: '200x200#',
    desktop: '300x300#',
    medium: '300x300>',
  }, default_url: "logo_no_name.png"
  validates_attachment_content_type :pastor_signature, :content_type => /\Aimage\/.*\Z/

	has_attached_file :pastor_photo,
	styles: {
		icon: '40>',
		thumb: '100x100>',
		square: '200x200#',
		desktop: '300x300#',
		medium: '300x300>',
		mobile: '414x414>',
	}, default_url: "logo_no_name.png"
	validates_attachment_content_type :pastor_photo, :content_type => /\Aimage\/.*\Z/

def to_param
  slug
end

def self.get_podcasts(location)
	podcasts=Podcast.where(location_id: location.id).order('dateof DESC').limit(3)
end

def self.get_connect_groups(location)
	connect_groups = ConnectGroup.where(location_id: location.id).where(approved: true)
end

def self.get_events(location)
	events = Event.where(location_id: location.id).where("starttime > ?", Date.today)
end

def svg?
  self.logo_content_type === 'image/svg+xml'
end

def photo_url
	photo.url(:slider)
end

def photo_mobile_url
	photo.url(:mobile)
end

def logo_url
	logo.url(:original)
end

def pastor_photo_url
	pastor_photo(:mobile)
end

private

def full_address
	full_address = address + ', ' + city + ' ' + province
end

def create_slug
      self.slug = name.parameterize
    end


end
