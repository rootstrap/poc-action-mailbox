class TicketMailer < ApplicationMailer
  def new_ticket(user:, ticket_id:)
    @from = "support-#{ticket_id}@rootstrap.com"
    @ticket_id = ticket_id
    subject = I18n.t('email.ticket.new_ticket', ticket_id:)
    mail from: @from, to: user.email, subject:
  end
end
