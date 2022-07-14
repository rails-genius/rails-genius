# frozen_string_literal: true

require 'test_helper'

class SampleServiceTest < ActiveSupport::TestCase
  describe '#call' do
    subject { SampleService.call!(**args) }

    context 'valid args' do
      let(:args) { { first_name: 'John', last_name: 'Doe' } }

      it 'success' do
        assert_instance_of(User, subject)
      end
    end

    context 'invalid args' do
      let(:args) { {} }

      it 'raises ActiveModel::ValidationError' do
        assert_raise(ActiveModel::ValidationError) do
          subject
        end
      end
    end

    context 'trigger custom error' do
      let(:args) { { first_name: 'John', last_name: 'Doe' } }

      before do
        SampleService.any_instance.stubs(:trigger_error).returns(true)
      end

      it 'raises SampleService::SampleServiceError' do
        assert_raise(SampleService::SampleServiceError) do
          subject
        end
      end
    end
  end
end
