class PodcastsController < ApplicationController
  before_action :authenticate_user!, except: [:revelstoke, :kelowna]
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:revelstoke, :kelowna]

  def index
    @podcasts = Podcast.all
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)
    @podcast.save ? redirect_to(@podcast, notice: 'Podcast was successfully created') : render(action: 'new')
  end

  def update
    @podcast.update(podcast_params) ? redirect_to(@podcast, notice: 'Podcast was successfully updated.') : render(action: 'edit')
  end

  def destroy
    @podcast.destroy
    redirect_to podcasts_url
  end

  def revelstoke
    @podcasts = Podcast.includes(:location).where('locations.name'=> 'Revelstoke').limit(20)
  end

  def kelowna
    @podcasts = Podcast.includes(:location).where('locations.name'=> 'Kelowna').limit(20)
  end


  private
# Use callbacks to share common setup or constraints between actions.
def set_podcast
  @podcast = Podcast.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def podcast_params
  params.require(:podcast).permit(:title, :source, :description, :author, :dateof, :location_id, :file)
end
end
