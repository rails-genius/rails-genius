# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'
require 'sidekiq/testing/inline'

module ActiveSupport
  class TestCase
    # use memoize def
    extend Memoist
    # use create() or build() with factory_bot
    include FactoryBot::Syntax::Methods

    # parallelize by default
    parallelize(workers: :number_of_processors)

    class << self
      # support context
      alias :context :describe
    end
  end
end
