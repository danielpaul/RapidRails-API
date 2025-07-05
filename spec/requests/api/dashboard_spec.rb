require 'rails_helper'

RSpec.describe 'API::Dashboard', type: :request do
  describe 'GET /api/dashboard' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }

      before do
        mock_clerk_authentication(user)
      end

      it 'returns dashboard data' do
        get '/api/dashboard'
        
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to include(
          'message' => 'Welcome to your dashboard',
          'user' => {
            'id' => user.id,
            'clerk_id' => user.clerk_id,
            'name' => 'Test User'
          }
        )
      end

      context 'when user belongs to an organization' do
        let(:org) { create(:org) }

        before do
          mock_clerk_org_authentication(user, org)
        end

        it 'returns dashboard data with organization' do
          get '/api/dashboard'
          
          expect(response).to have_http_status(:ok)
          expect(response.parsed_body).to include(
            'message' => 'Welcome to your dashboard',
            'user' => {
              'id' => user.id,
              'clerk_id' => user.clerk_id,
              'name' => 'Test User'
            },
            'org' => org.clerk_org_id
          )
        end
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized error' do
        get '/api/dashboard'
        
        expect(response).to have_http_status(:unauthorized)
        expect(response.parsed_body).to eq('error' => 'Unauthorized')
      end
    end
  end
end 