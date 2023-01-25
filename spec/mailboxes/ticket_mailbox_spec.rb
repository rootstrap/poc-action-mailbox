require 'rails_helper'

RSpec.describe TicketMailbox, type: :mailbox do
  subject { process(mail) }

  let(:body) { Faker::Lorem.paragraphs(number: 2).join(',') }
  let(:mail_subject) { Faker::Internet.name }

  context 'with valid params' do
    let(:user) { create(:user) }
    let(:mail) do
      Mail.new(from: user.email,
               to: 'support@rootstrap.com',
               subject: mail_subject,
               body:)
    end

    it 'marks email as delivered when the from receipt is monterrey' do
      expect(subject).to have_been_delivered
    end

    it 'creates a new Ticket' do
      expect { subject }.to change(Ticket, :count).from(0).to(1)
    end
  end

  context 'with invalid params' do
    context 'when a user does not exist' do
      let(:mail) do
        Mail.new(from: Faker::Internet.email,
                 to: UserMailer::SUPPORT_ADDRESS,
                 subject: mail_subject,
                 body:)
      end

      it 'replies with an error message email' do
        expect(subject).to have_bounced
      end
    end
  end
end
