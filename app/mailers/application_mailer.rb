# here you can use and Env var in from's variable
class ApplicationMailer < ActionMailer::Base
  SUPPORT_ADDRESS = 'support@rootstrap.com'.freeze
  SUPPORT_DOMAIN =  SUPPORT_ADDRESS.gsub(/.+@([^.]+)/, '\1')

  default from: SUPPORT_ADDRESS
  layout 'mailer'
end
