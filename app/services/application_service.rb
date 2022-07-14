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
  include Jobify
  include ActiveModel::Validations

  # @param [Hash] opts
  # @return [ApplicationService]
  def initialize(**opts)
    opts.each do |attribute, value|
      public_send("#{attribute}=", value)
    end
  end

  class << self
    # use it to call the service
    # it's handled in background if jobify is defined
    #
    # @param [Hash] opts
    # @raise [ActiveModel::ValidationError]
    def call!(**opts)
      return call_jobify!(**opts) if jobify_options.present?
      private_call!(**opts)
    end
    # it's recommended to use call!()
    # call the service and process it background
    # @param [Hash] jobify_options pass dynamic options for jobify
    # @option jobify_options [Symbol] :queue the queue to process: low | default | critical
    # @param [Hash] opts
    def call_jobify!(jobify_options: nil, **opts)
      opts[:jobify_options] = jobify_options || self.jobify_options
      ApplicationService::Jobify::Enqueue.new(opts, self.name).call
    end

    protected
      # don't direct call it
      def private_call!(**opts)
        new(**opts).yield_self do |instance|
          instance.validate!
          instance.call
        end
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
