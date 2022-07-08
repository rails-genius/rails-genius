# frozen_string_literal: true

require 'application_system_test_case'

module Sessions
  class RegistrationsTest < ApplicationSystemTestCase
    let(:user) { build(:user) }
    let(:password) { SecureRandom.hex }

    it 'it can register with email and password' do
      visit '/users/sign_up'

      assert_changes -> { User.count }, from: 0, to: 1 do
        fill_in 'email', with: user.email
        fill_in 'password', with: password
        fill_in 'password_confirmation', with: password

        click_on 'Sign up'

        binding.pry
      end
    end
  end
end
