# frozen_string_literal: true

module Devise
  class Login < ApplicationComponent
    def response
      title
      verify_message

      form

      rails_render 'devise/shared/links'
    end

  private
    def form
      matestack_form form_config do
        form_input label: 'Email', key: :email, type: :email
        form_input label: 'Password', key: :password, type: :password
        button text: 'Sign in', type: :submit
      end

      toggle show_on: 'sign_in_failure' do
        plain 'Your email or password is not valid.'
      end
    end

    def title
      resource_name
    end

    def form_config
      {
        for: user,
        method: :post,
        path: session_path(resource_name),
        success: {
          redirect: {
            follow_response: true
          }
        },
        failure: {
          emit: 'sign_in_failure'
        }
      }
    end

    def verify_message
      return unless user.email

      div do
        paragraph "Please verify your email: #{user.email}"
      end
    end

    def user
      @user ||= User.new(email: params[:email])
    end
  end
end
