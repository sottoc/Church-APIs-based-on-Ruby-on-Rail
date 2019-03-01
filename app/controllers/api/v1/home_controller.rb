class Api::V1::HomeController < ApiController

  def index
    @featured = Event.all.where(featured: true).order("starttime ASC").as_json(:methods => [:image_url])
    @locations = Location.all.where(show_in_listing: true).as_json(:methods => [:photo_url, :photo_mobile_url, :logo_url])
    render json: { :locations => @locations, :featured => @featured }.to_json
  end
end
