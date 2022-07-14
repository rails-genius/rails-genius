# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend Memoist
  include Matestack::Ui::Core::Helper
  matestack_layout ApplicationLayout

  memoize def current_user
    RequestStore.store[:current_user] = warden.authenticate(scope: :user)
  end
end
