# here you can use and Env var in from's variable
class ApplicationMailer < ActionMailer::Base
  default from: 'support@rootstrap.com'
  layout 'mailer'
end
