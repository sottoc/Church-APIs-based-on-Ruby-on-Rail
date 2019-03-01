class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :all_locations]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :index

  respond_to :html

  def all_locations
    @locations = Location.all.where(show_in_listing: true)
  end

  def index
    @locations = Location.all
  end

  def show
    respond_with(@location)
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def create
    @location = Location.new(location_params)
    @location.save
    respond_with(@location)
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
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
