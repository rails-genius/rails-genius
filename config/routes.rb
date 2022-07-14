# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'static_pages#index'

  # authenticate :user, ->(user) { user.admin? || Other auth related checks... } do  mount Sidekiq::Web => "/sidekiq"end

  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api, format: :json do
    namespace :v1 do
      root 'base#index'
    end
  end
end
