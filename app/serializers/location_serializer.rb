class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :city, :province, :address
  has_many :events
  has_many :connect_groups
  has_many :podcasts
end
