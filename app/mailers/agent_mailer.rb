class AgentMailer < ApplicationMailer
  default from: 'notifications@leadspro.com'

  def welcome_email
    @agent = params[:agent]
    @url = 'http://example.com/login'
    mail(to: @agent.email, subject: 'Welcome to My Awesome Site')
  end
end
