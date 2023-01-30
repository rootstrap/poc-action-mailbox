# here is where the magic happens. When an inbound email arrived, the routing (this file) is
# in charge to deliver that email to the correct Action-Mailbox. In this case, if the email.from
# has a email address with 'support@rootstrap.com' this one is routed to TicketMailbox.
# Be careful with the routing order. You must go from specific to general if the regex are similar.
# # https://rubular.com/ can help you with your regex

class ApplicationMailbox < ActionMailbox::Base
  before_processing :ensure_user_presence

  routing(/#{ApplicationMailer::SUPPORT_ADDRESS}/i => :ticket)
  routing(/ticket-\d+#{ApplicationMailer::SUPPORT_DOMAIN}/i => :comments)

  private

  def user
    @user ||= User.find_by(email: mail.from)
  end

  def ensure_user_presence
    bounce_with UserMailer.missing_user(inbound_email) if user.nil?
  end
end
