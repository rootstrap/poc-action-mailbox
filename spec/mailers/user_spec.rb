require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:inbound_email) { Faker::Internet.email }

  context 'when the user does not exist in database' do
    it 'replies with an error message email' do
      expect { UserMailer.missing_user(inbound_email).deliver_now }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
