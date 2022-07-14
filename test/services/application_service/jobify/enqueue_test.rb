# frozen_string_literal: true

require 'test_helper'

class ApplicationService
  module Jobify
    class EnqueueTest < ActiveSupport::TestCase
      class SampleServiceClass < ApplicationService
        jobify

        def call
        end
      end

      describe 'SampleServiceClass.call!' do
        subject do
          SampleServiceClass.call!
        end

        it 'calls SampleServiceClass#call from sidekiq' do
          SampleServiceClass.any_instance.expects(:call).once

          subject
        end
      end
    end
  end
end
