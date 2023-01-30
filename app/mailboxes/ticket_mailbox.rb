# After routing, this file is in charge to process the inbound email.
# We validate if the user exist in the database
# We bounced! the process if user is nil
# <<process>> method is mandatory

class TicketMailbox < ApplicationMailbox
  def process
    Ticket.create!(subject: mail.subject, body: mail.body, user:)
  end
end
