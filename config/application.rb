# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
# use https://github.com/bkeepers/dotenv only for local development
# for production and staging use bin/rails secrets:edit
Dotenv::Railtie.load if defined? Dotenv

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsGenius
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.autoload_paths << Rails.root.join('app', 'matestack', 'pages')
    config.autoload_paths << Rails.root.join('app', 'matestack', 'layouts')
    config.autoload_paths << Rails.root.join('app', 'matestack', 'components')

    # configure timezone
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc

    # Internationalization
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}')]
    config.i18n.default_locale = :en

    # use sidekiq by default
    config.active_job.queue_adapter = :sidekiq

    # use structure.sql
    config.active_record.schema_format = :sql

    config.active_record.async_query_executor = :global_thread_pool
  end
end
