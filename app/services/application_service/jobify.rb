# frozen_string_literal: true

class ApplicationService
  # Allow service classes to be backgrounded
  module Jobify
    extend ActiveSupport::Concern

    included do
      class_attribute :jobify_options, default: {}
    end

    class_methods do
      # configure service class to be processed in background
      # @param [Symbol] queue
      def jobify(queue: :default)
        self.jobify_options = {
          queue:
        }
      end
    end
  end
end
