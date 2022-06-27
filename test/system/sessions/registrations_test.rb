# frozen_string_literal: true

require 'application_system_test_case'

module Sessions
  class RegistrationsTest < ApplicationSystemTestCase
    test 'it can register with email and password' do
      visit '/users/sign_up'

      fill_in 'email', with: user.email
    end

    memoize def user
      build(:user)
    end
  end
end
