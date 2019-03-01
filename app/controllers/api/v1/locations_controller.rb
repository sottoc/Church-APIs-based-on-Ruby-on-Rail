class Api::V1::LocationsController < ApiController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
    render json: @locations
    # render(
    #   json: LocationSerializer.new(
    #     @locations, each_serializer: LocationSerializer,
    #                 root: "@locations",
    #  ),
    # )
  end

  def show
    @location = Location.find(params[:id])
    render json: @location
  end

  def get_location
      @location = Location.find_by(slug: params[:id])
      if @location
          @events = Location.get_events(@location).as_json(:methods => [:image_url])
          @podcasts = Location.get_podcasts(@location)
          @connect_groups = Location.get_connect_groups(@location)
          render json: { :location => @location.as_json(:methods => [:photo_url, :photo_mobile_url, :logo_url, :pastor_photo_url]), :events => @events, :podcasts => @podcasts, :connect_groups => @connect_groups }.to_json
  # ...
      else
          render json: @location
  # ...
      end
      #@location.to_json(:include => [:events, :podcasts, :connect_groups])
  end

  private

  def set_location
    @location = Location.find_by(slug: params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :latitude,
                                     :longitude, :phone, :show_in_listing, :photo, :city, :province,
                                     :code, :logo, :pastor_photo, :pastor_signature, :day, :times, :welcome,
                                     :pastor_name, :facebook, :twitter, :instagram, :slug, :inline_logo)
  end
end
