# frozen_string_literal: true

module Api
  module V1
    class BaseControllerTest < ActionDispatch::IntegrationTest
      describe 'GET /api/v1' do
        let(:key) { create(:api_key) }

        it 'success' do
          get '/api/v1', headers: { "Authorization": "Bearer #{key.token}" }

          assert_response :success
          assert_equal 'ok', json[:status]
        end
      end
    end
  end
end
