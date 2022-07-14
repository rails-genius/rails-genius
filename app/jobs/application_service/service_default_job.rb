# frozen_string_literal: true

class ApplicationService
  # job that runs service objects in background with arguments passed
  class ServiceDefaultJob < ApplicationJob
    queue_as :default

    # @param [Hash] opts
    # @param [String] class_name
    def perform(opts, class_name)
      ApplicationService::Jobify::RunJob.new(opts, class_name).call
    end
  end
end
