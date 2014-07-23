class ContactAdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_admin
  	mail(to: 'feliperodriguezarteaga@gmail.com', subject:' Welcome to my awesome site')
  end
end

