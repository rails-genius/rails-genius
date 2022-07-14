# frozen_string_literal: true

# base class for all services
# generate new services with:
#   rails g service nested/service
#   or
#   rails g service Nested::Service
#
# use service classes as:
#   SampleService.call!(first_name: "John", last_name: "Doe")
# @see SampleService
class ApplicationService
  include ActiveModel::Validations

  # @param [Hash] opts
  # @return [ApplicationService]
  def initialize(**opts)
    opts.each do |attribute, value|
      public_send("#{attribute}=", value)
    end
  end

  # @param [Hash] opts
  # @raise [ActiveModel::ValidationError]
  def self.call!(**opts)
    new(**opts).yield_self do |instance|
      instance.validate!
      instance.call
    end
  end

  # @abstract
  def call; end

  # use this to handle errors
  # @param [Array] args
  def raise(*args)
    if args[0].is_a?(ActiveModel::ValidationError)
      Kernel.raise args[0]
    else
      Kernel.raise class_error, *args
    end
  end

  # @return [Class<ServiceError>]
  def class_error
    ServiceError
  end
end

# inherit from this class to generate custom errors
class ServiceError < StandardError; end
