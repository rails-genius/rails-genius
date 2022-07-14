# frozen_string_literal: true

# base controller class for html
class ApplicationController < ActionController::Base
  extend Memoist
  include Matestack::Ui::Core::Helper
  matestack_layout ApplicationLayout

  # get authenticated user
  # @return [User,nil]
  def current_user
    RequestStore.store[:current_user] = warden.authenticate(scope: :user)
  end

  memoize :current_user
end
