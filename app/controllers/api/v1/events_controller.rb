class Api::V1::EventsController < ApiController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @events = Event.find(params[:id])
    render json: @events
  end

  def featured_events
      # @featured = Event.all.where(["starttime > ?", Time.now.ago(2.days)]).order("starttime ASC").where(featured: true).limit(1)
      @featured = Event.all.where(featured: true).order("starttime ASC").as_json(:methods => [:image_url])
      render json: @featured
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.

  def event_params
    params.require(:event).permit(:title, :description, :starttime, :endtime, :image,
                                  :location_id, :featured, :event_type_id, :hash_tag,
                                  :facebook, :repeat, :frequency, :repeat_date, :repeat_day, :repeat_week, :limit)
  end
end
