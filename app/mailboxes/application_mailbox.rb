# here is where the magic happens. When an inbound email arrived, the routing (this file) is
# in charge to deliver that email to the correct Action-Mailbox. In this case, if the email.from
# has a email address with 'support@rootstrap.com' this one is routed to TicketMailbox.
# Be careful with the routing order. You must go from specific to general if the regex are similar.
# # https://rubular.com/ can help you with your regex

class ApplicationMailbox < ActionMailbox::Base
  routing(/support@rootstrap.com/i => :ticket)
end
