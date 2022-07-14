# frozen_string_literal: true

# A sample service, you can delete this file safely
#
# @!attribute first_name
#   @return [String, nil]
# @!attribute last_name
#   @return [String, nil]
class SampleService < ApplicationService
  attr_accessor :first_name, :last_name
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  class SampleServiceError < ServiceError; end

  # instantiates a new User
  # @return [User]
  def call
    if trigger_error
      raise 'error has been triggered'
    end
    User.new(name: "#{first_name} #{last_name}")
  end

  # @return [Class<SampleService::SampleServiceError>]
  def class_error
    SampleServiceError
  end

  # @return [FalseClass]
  def trigger_error
    false
  end
end
