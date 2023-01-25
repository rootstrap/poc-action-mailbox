# here you can use and Env var in from's variable
class ApplicationMailer < ActionMailer::Base
  SUPPORT_ADDRESS = 'support@rootstrap.com'.freeze
  default from: SUPPORT_ADDRESS
  layout 'mailer'
end
