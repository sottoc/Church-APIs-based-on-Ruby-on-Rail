class UserMailer < ActionMailer::Base
  default from: "contact@c3church.ca"

  def new_message(message)
  	@message = message
  	mail(to: 'info@c3church.ca', subject: 'A message from ' + @message.name.titleize + ' was left on C3Church.ca', from: @message.email)
  end
end
