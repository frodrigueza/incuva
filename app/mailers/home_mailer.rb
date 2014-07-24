class HomeMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(member)
    @member = member
    @url  = 'http://example.com/login'
    mail(to: 'feliperodriguezarteaga@gmail.com', subject: 'Welcome to My Awesome Site')
  end

  def contact_admin(number)
  	mail(to: 'feliperodriguezarteaga@gmail.com', subject: 'Welcome to My Awesome Site')
  end


end