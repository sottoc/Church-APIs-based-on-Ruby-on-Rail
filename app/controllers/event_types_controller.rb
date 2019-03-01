class EventTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @event_types = EventType.all
  end

  def new
    @event_type = EventType.new
  end

  def create
    @event_type = EventType.new(event_type_params)
    @event_type.save ? redirect_to(@event_type, notice: 'Event type was successfully created.') : render(action: 'new')
  end

  def update
    @event_type.update(event_type_params) ? redirect_to(@event_type, notice: 'Event type was successfully updated.') : render(action: 'edit')
  end

  def destroy
    @event_type.destroy
    redirect_to event_types_url
  end

  private
# Use callbacks to share common setup or constraints between actions.
def set_event_type
  @event_type = EventType.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def event_type_params
  params.require(:event_type).permit(:name, :description)
end
end
