class UserMailer < ApplicationMailer
  def missing_user(inbound_email)
    mail to: inbound_email,
         subject: I18n.t('email.user.you_do_not_belong_here')
  end
end
