# frozen_string_literal: true

class ApplicationLayout < Matestack::Ui::Layout
  def response(&block)
    Navigation::NavbarComponent.call

    matestack_vue_js_app(&block)
  end
end
