class Message 

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :email, :name, :message, :not, :type, :place

	validates :email, presence: true
	validates_email_format_of :email, message: 'is not looking good'

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def persisted?
		false
	end
end
