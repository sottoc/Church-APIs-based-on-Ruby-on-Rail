class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.type == 'contact' 
        UserMailer.new_message(@message).deliver
        redirect_to root_path, notice: 'Your message was sent... thanks'
      elsif @message.type == 'ticket'
        TicketMailer.new_message(@message).deliver
        redirect_to easter_path
      end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :message, :not, :type, :place)
    end
end
