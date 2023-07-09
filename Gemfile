# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem 'rails', '~> 7.0'
gem 'rails', github: 'rails/rails', branch: 'main'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails', '~> 3.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.6'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 1.1'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 1.1'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.7', require: %w[redis redis/connection/hiredis]

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.12', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '~> 4.2'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem 'rack-mini-profiler', '~> 3.0'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring', '~> 4.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '~> 3.37'
  gem 'selenium-webdriver', '~> 4.3'
  gem 'webdrivers', '~> 5.0'
end

### End Rails
### Start Rails Genius

group :development do
  # RuboCop configuration which has the same code style checking as official Ruby on Rails
  gem 'rubocop-rails_config', '~> 1.10', '>= 1.10.1'
  # ERB Linter tool.
  gem 'erb_lint', '~> 0.2.0', require: false
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem 'annotate', '~> 3.2'
  # Process manager for applications with multiple components
  gem 'foreman', '~> 0.87.2', require: false
  # sidekiq command for spring
  gem 'spring-commands-sidekiq', '~> 1.0', require: false
  # A single dependency-free binary to manage all your git hooks that works with any language in any environment,
  # and in all common team workflows.
  gem 'lefthook', '~> 1.0', '>= 1.0.5', require: false
  # Provides a better error page for Rails and other Rack apps. Includes source code inspection,
  # a live REPL and local/instance variable inspection for all stack frames.
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  # Provides the Binding#of_caller method. Using binding_of_caller we can grab bindings from
  # higher up the call stack and evaluate code in that context. Allows access to bindings arbitrarily far up the call stack,
  # not limited to just the immediate caller. Recommended for use only in debugging situations. Do not use this in production apps.
  gem 'binding_of_caller', '~> 1.0'
end

group :development, :test do
  # Use Pry as your rails console
  gem 'pry-rails', '~> 0.3.9'
  # Autoload dotenv in Rails.
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # bundler-audit provides patch-level verification for Bundled apps.
  gem 'bundler-audit', '~> 0.9.1', require: false
  # Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis.
  gem 'brakeman', '~> 5.2', '>= 5.2.3', require: false
  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.2'
end

group :test do
  # Cuprite is a driver for Capybara that allows you to run your tests on a headless Chrome browser
  gem 'cuprite', '~> 0.13'
  # The minitest-spec-rails gem makes it easy to use the \ MiniTest::Spec DSL within your existing Rails test suite.
  gem 'minitest-spec-rails', '~> 6.1'
  # Ffaker generates dummy data.
  gem 'ffaker', '~> 2.21'
  # Mocking and stubbing library with JMock/SchMock syntax, which allows mocking and stubbing of
  # methods on real (non-mock) classes.
  gem 'mocha', '~> 1.14'
  # re-run the test when the test fails
  gem 'minitest-retry', '~> 0.2.2'
end

group :production, :staging do
  # Ruby notifier for bugsnag.com
  gem 'bugsnag', '~> 6.24', '>= 6.24.2', require: !ENV['BUGSNAG_API_KEY'].nil?
end

# Eliminate N+1s automatically
gem 'jit_preloader', '~> 2.0'
# The fastest JSON parser and object serializer.
gem 'oj', '~> 3.13', '>= 3.13.14'
# Matestack provides a collection of open source gems made for Ruby on Rails developers.
# Matestack enables you to craft interactive web UIs without JavaScript in pure Ruby with minimum effort.
# UI code becomes a native and fun part of your Rails app.
gem 'matestack-ui-core', '~> 3.0', '>= 3.0.1'
gem 'matestack-ui-vuejs', '~> 3.1'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.8', '>= 4.8.1'
# A generalized Rack framework for multiple-provider authentication.
gem 'omniauth', '~> 2.1'
# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 6.5', '>= 6.5.1'
# Integrate Tailwind CSS with the asset pipeline in Rails.
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.10'
# Ruby wrapper for hiredis (protocol serialization/deserialization and blocking I/O)
gem 'hiredis', '~> 0.6.3'
# memoize methods invocation
gem 'memoist', '~> 0.16.2'
# String enums for Rails
gem 'str_enum', '~> 0.3.0'
# Rails adapter for AnyCable
gem 'anycable-rails', '~> 1.3', '>= 1.3.4'
# A HTTP client and server library.
gem 'async-http', '~> 0.60.0'
# Provides an adaptor between async-http and faraday.
gem 'async-http-faraday', '~> 0.11.0'
# HTTP/REST API client library.
gem 'faraday', '~> 2.3'
# An easy-to-use client library for making requests from Ruby.
# It uses a simple method chaining system for building requests, similar to Python's Requests.
gem 'http', '~> 5.1'
# Faster and simpler JSON renderer for Rails
gem 'jb', '~> 0.8.0'
# RequestStore gives you per-request global storage.
gem 'request_store', '~> 1.5', '>= 1.5.1'
### End Rails Genius
