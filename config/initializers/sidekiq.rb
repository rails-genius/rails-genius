# frozen_string_literal: true

# configure sidekiq only for development, staging, and production
return if Rails.env.test?
Redis.exists_returns_integer = false

Sidekiq.configure_server do
  # flush redis on development only
  if Rails.env.development?
    Sidekiq.redis { |conn| conn.flushdb }
  end
end

if defined? Bugsnag
  Sidekiq.default_worker_options = { 'backtrace' => 20 }

  Sidekiq.configure_server do |config|
    config.error_handlers << Proc.new { |ex| Bugsnag.notify(ex) }
  end
end
