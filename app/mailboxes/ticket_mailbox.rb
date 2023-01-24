# After routing, this file is in charge to process the inbound email.
# We validate if the user exist in the database
# We bounced! the process if user is nil
# <<process>> method is mandatory

class TicketMailbox < ApplicationMailbox
  before_processing :ensure_user

  def process
    Ticket.create!(subject: mail.subject, body: mail.body, user:)
  end

  private

  def user
    User.find_by(email: mail.from)
  end

  def ensure_user
    bounce_with UserMailer.missing(inbound_email) if user.nil?
  end
end
