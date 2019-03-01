class ContributionsController < ApplicationController

  def index
  end

  def new
#    @contribution = Contribution.new
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def contribution_params
    params.require(:contribution).permit(:name, :email, :amount, :source, :stripeToken)
  end

end
