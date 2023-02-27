require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  let(:ticket) { create(:ticket) }
  let(:ticket_token) { ticket.token }

  describe 'GET /confirm' do
    it 'returns http success' do
      get "/ticket/confirm/#{ticket_token}"
      expect(response).to have_http_status(:success)
    end
  end
end
