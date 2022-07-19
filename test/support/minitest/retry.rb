# frozen_string_literal: true

# configure minitest to retry on the CI
# to handle flaky tests
return unless ENV['GITHUB_CI']

require 'minitest/retry'

Minitest::Retry.use!(
  retry_count:  3,         # The number of times to retry. The default is 3.
  verbose: true,           # Whether or not to display the message at the time of retry. The default is true.
  io: $stdout,             # Display destination of retry when the message. The default is stdout.
  exceptions_to_retry: [], # List of exceptions that will trigger a retry (when empty, all exceptions will).
  methods_to_retry:    []  # List of methods that will trigger a retry (when empty, all methods will).
)
