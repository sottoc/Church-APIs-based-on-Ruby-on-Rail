class ConnectGroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :set_connect_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:index, :new, :create]


  def index
    @connect_groups = ConnectGroup.all.order("day ASC")
    @connect_groups_approved = @connect_groups.where(approved: true)
  end

  def not_approved_index
    @connect_groups = ConnectGroup.all.order("day ASC")
    @connect_groups_not_approved = ConnectGroup.all.where(approved: [false,nil])
  end

  def new
    @connect_group = ConnectGroup.new
  end

  def create
    @connect_group = ConnectGroup.new(connect_group_params)
    if user_signed_in?
      @connect_group.save ? redirect_to(@connect_group, notice: 'Connect group was successfully created.') : render(action: 'new')
    else @connect_group.save ? redirect_to(connect_groups_path, notice: 'Thank you for registering your connect group') : render(action: 'new')
    end
  end

  def update
    @connect_group.update(connect_group_params) ? redirect_to(@connect_group, notice: 'Connect group was successfully updated.') : render(action: 'edit')
  end

  def destroy
    @connect_group.destroy
    redirect_to connect_groups_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_connect_group
    @connect_group = ConnectGroup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def connect_group_params
    params.require(:connect_group).permit(:name, :leader, :phone, :location_id, :time, :day, :latitude, :longitude, :address, :avatar, :approved)
  end
end
