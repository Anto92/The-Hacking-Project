class ApplicationMailer < ActionMailer::Base
  default from: 'comptethp@gmail.com'
  layout 'welcome_email'
end
