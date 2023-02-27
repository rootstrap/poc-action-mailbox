require 'rails_helper'

RSpec.describe 'click on the email link' do
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket, user:) }
  let(:email) { TicketMailer.new_ticket(user:, ticket:).deliver_now }
  let(:email_body_html) { Nokogiri::HTML(email.body.to_s) }
  let(:target_link) { email_body_html.at("a:contains('ticket url')") }
  let(:link) { URI.parse(target_link['href']) }

  context 'when the user clicks the link email before 15 minutes' do
    before { visit(link) }
    it 'shows the confirmation page' do
      expect(page).to have_text('YOU TICKET HAS BEEN CONFIRMED , ENJOY')
    end
  end

  context 'when the user clicks the link email after 15 minutes' do
    before { visit(link) }
    it 'shows the expiration page' do
      travel 1.day
      visit(link)
      expect(page).to have_text('TOKEN EXPIRED OR INVALID')
    end
  end
end
