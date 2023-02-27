class TicketMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  def new_ticket(user:, ticket:)
    ticket_id = ticket.id
    @from = "support-#{ticket_id}@rootstrap.com"
    @ticket_id = ticket_id
    @url_confirm = ticket_url_confirm(ticket.token)
    subject = I18n.t('email.ticket.new_ticket', ticket_id:)
    mail from: @from, to: user.email, subject:
  end

  def missing_ticket(inbound_email)
    mail to: inbound_email,
         subject: I18n.t('email.ticket.ticket_does_not_exist')
  end

  private

  def ticket_url_confirm(token)
    confirm_ticket_url(token)
  end
end
