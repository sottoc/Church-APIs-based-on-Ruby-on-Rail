class Api::V1::PodcastsController < ApiController
  def index
    @podcasts = Podcast.all.order("dateof DESC").limit(9)
    render json: @podcasts
  end

  def show
    @podcast = Podcast.find(params[:id])
    render json: @podcast
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def podcast_params
    params.require(:podcast).permit(:title, :source, :description, :author, :dateof, :location_id, :file)
  end
end
