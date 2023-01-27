class CommentsMailbox < ApplicationMailbox
  before_processing :ensure_ticket

  TICKET_EXPRESSION = /ticket-(?<ticket_id>\d+)+@(?<domain>\w+)/

  def process
    ticket.comments.create!(body: mail.encoded)
  end

  private

  def ticket
    recipient = mail.recipients.find { |email_address| TICKET_EXPRESSION.match?(email_address) }
    id = recipient.match(TICKET_EXPRESSION)[:ticket_id]
    @ticket ||= Ticket.find_by(id:)
  end

  def ensure_ticket
    bounce_with TicketMailer.missing(inbound_email) if ticket.nil?
  end
end
