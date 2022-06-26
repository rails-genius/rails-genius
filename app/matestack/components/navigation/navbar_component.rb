# frozen_string_literal: true

module Navigation
  class NavbarComponent < ApplicationComponent
    def response
      div class: 'bg-purple-600 flex' do
        div do
          h1 'ok'
        end
      end
    end
  end
end
