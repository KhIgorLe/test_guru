class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDER']
  layout 'mailer'
end
