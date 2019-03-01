class ConnectGroup < ApplicationRecord

	belongs_to :location

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	validates :name, presence: true
	validates :leader, presence: true
	validates :phone, presence: true, format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: 'not a phone number' }
	validates :time, presence: true
	#validates :location, presence: true
	validates :day, presence: true
	validates :address, presence: true

	has_attached_file :avatar,
	styles: { medium: "300x300>", thumb: "100x100>", location: "75x75^" }, default_url: ":style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	def self.approval_pending campus
		self.all.where(approved: [false,nil]).count
	end
end
