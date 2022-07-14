# frozen_string_literal: true

#
# Run Services in background
#
class ApplicationService
  module Jobify
    # @!attribute opts
    #   @return [Hash]
    # @!attribute class_name
    #   @return [String]
    class Enqueue < ApplicationService
      class EnqueueError < ServiceError; end
      attr_reader :opts, :class_name

      # @param [Hash] opts
      # @param [String] class_name
      def initialize(opts, class_name)
        @opts = opts
        @class_name = class_name
      end

      # @return [ApplicationService::ServiceCriticalJob, FalseClass, ApplicationService::ServiceDefaultJob, ApplicationService::ServiceLowJob, nil]
      def call
        jobify_options = opts.delete(:jobify_options)
        queue = jobify_options[:queue]

        if queue == :low
          ServiceLowJob.perform_later(opts, class_name)
        elsif queue == :default
          ServiceDefaultJob.perform_later(opts, class_name)
        elsif queue == :critical
          ServiceCriticalJob.perform_later(opts, class_name)
        else
          raise "Invalid queue #{queue}"
        end
      end

      # @return [Class<ApplicationService::Jobify::Enqueue::EnqueueError>]
      def class_error
        EnqueueError
      end
    end
  end
end
