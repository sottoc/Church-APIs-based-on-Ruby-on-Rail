class Api::V1::ConnectGroupsController < ApiController
    def index
      @connect_groups = ConnectGroup.all.order("day ASC")
      @connect_groups_approved = @connect_groups.where(approved: true).limit(4)
      render json: @connect_groups_approved.to_json( :include => [:location] )
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.

end
