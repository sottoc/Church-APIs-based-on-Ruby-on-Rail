class Event < ApplicationRecord
	# rolify

	belongs_to :event_type
	belongs_to :location

	# This method associates the attribute ":avatar" with a file attachment
	has_attached_file :image,
		styles: {
		icon: '40>',
		thumb: '100x100>',
		medium: '300x300>',
		eventThumbnail: '400x225>#',
	},
	convert_options: {
		medium: "-quality 75 -strip",
		eventThumbnail: "-quality 75 -strip"
	},
	default_url: "c3church_event_logo_no_name.png"

	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: true
	validates :description, presence: true
	validates :location_id, presence: true
	validates :event_type_id, presence: true
	validates :facebook, presence: false
	validates :facebook,
	format: {:with => URI::regexp(%w(http https)), message: 'Try copying the full address from your browser'},
	allow_blank: true

	def image_url
    	image.url(:eventThumbnail)
    end

end
