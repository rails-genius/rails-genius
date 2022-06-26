# frozen_string_literal: true

module Static
  class HomePage < ApplicationPage
    def response
      x = User.where(id: 4).all.load_async
      j = User.all
      p "OMG"
      p x, j

      div do
        h2 'Home Page'
      end
    end
  end
end
