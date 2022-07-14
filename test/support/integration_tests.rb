# frozen_string_literal: true

ActionDispatch::IntegrationTest.class_eval do
  extend Memoist

  # use this to test the response body json
  # @return [ActiveSupport::HashWithIndifferentAccess, nil]
  memoize def json
    body = response.body
    return unless body

    JSON.parse(response.body).with_indifferent_access
  rescue JSON::ParserError
    nil
  end

  # use this to sign in a user to the api instead of using headers
  # @param [Object] user
  # @return [User]
  memoize def sign_in(user = create(:user))
    Api::ApiController.any_instance.expects(:current_user).returns(user)
    user
  end
end
