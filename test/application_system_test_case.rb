# frozen_string_literal: true

require 'test_helper'
require 'capybara/cuprite'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, options: {
    # switch this to true to help with debug
    headless: ActiveRecord::Type::Boolean.new.cast(ENV.fetch('TEST_HEADLESS_BROWSER') { true })
  }
end
