class EventType < ApplicationRecord
	rolify

	has_many :events

	validates :name, presence: true
end
