# frozen_string_literal: true

# Default parent class for matestack components
class ApplicationComponent < Matestack::Ui::Component
  # Define required properties passed to call
  # @param [Array<Symbol>] required properties
  # @return [nil]
  # @!macro [attach] required
  #   @!method $1
  #     @return [Object] the $1 of the a
  def self.required(*fields)
    super(*fields)

    delegate(*fields, to: :context)
  end
end
