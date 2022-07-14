# frozen_string_literal: true

module Api
  # default api controller, authenticate using a ApiKey
  # the api request must have a header named Authorization formatted as:
  # Authorization: Bearer ApiKey.token
  class ApiController < ActionController::Base
    extend Memoist
    before_action :require_current_user

    protected
      memoize def current_user
        header = request.headers['Authorization']
        return unless header

        token = header.match(/Bearer (.*)/)[1]
        return unless token
        ApiKey.eager_load(:user).find_by(token:)&.user.tap do |user|
          RequestStore.store[:current_user] = user
        end
      end

      def require_current_user
        render json: { error: 'invalid api key' }, status: 403 unless current_user
      end
  end
end
