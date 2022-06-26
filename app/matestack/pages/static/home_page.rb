# frozen_string_literal: true

module Static
  class HomePage < ApplicationPage
    def response
      div do
        h2 'Home Page'
      end
    end
  end
end
