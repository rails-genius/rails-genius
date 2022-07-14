# frozen_string_literal: true

#
# Service description
#
class ApplicationService
  module Jobify
    # @!attribute opts
    #   @return [Hash]
    # @!attribute class_name
    #   @return [String]
    class RunJob
      attr_reader :opts, :class_name
      # @param [Hash] opts
      # @param [String] class_name
      def initialize(opts, class_name)
        @opts = opts
        @class_name = class_name
      end

      # call the original service with options
      def call
        class_name.constantize.send(:private_call!, **opts)
      end
    end
  end
end
