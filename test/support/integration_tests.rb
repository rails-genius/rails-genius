# frozen_string_literal: true

ActionDispatch::IntegrationTest.class_eval do
  extend Memoist

  memoize def json
    body = response.body
    return unless body

    JSON.parse(response.body).with_indifferent_access
  rescue JSON::ParserError
    nil
  end

  memoize def sign_in(user = create(:user))
    Api::ApiController.any_instance.expects(:current_user).returns(user)
    user
  end
end
