# frozen_string_literal: true

class ApplicationComponent < Matestack::Ui::Component
  def self.required(*fields)
    super(*fields)

    delegate(*fields, to: :context)
  end
end
