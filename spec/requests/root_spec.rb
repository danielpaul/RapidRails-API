require 'rails_helper'

RSpec.describe 'Root', type: :request do
  describe 'GET /' do
    it 'returns hello world message' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to eq('message' => 'Hello World')
    end
  end
end
