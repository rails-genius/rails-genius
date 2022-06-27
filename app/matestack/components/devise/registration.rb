# frozen_string_literal: true

module Devise
  class Registration < ApplicationComponent
    required :resource, :resource_name

    def response
      div class: 'text-center bg-white mx-auto p-2 rounded shadow-xl border w-full md:w-1/4' do
        title
        form

        rails_render 'devise/shared/links'
      end
    end

    private
      def form
        matestack_form form_config do
          div class: 'p-2' do
            c_text_input placeholder: 'Email', key: :email, type: :email, autocomplete: 'email', autofocus: true, required: true
            c_text_input placeholder: 'Password', key: :password, type: :password, required: true
            c_text_input placeholder: 'Password confirmation', key: :password_confirmation, type: :password, required: true
            div class: 'px-10' do
              button text: 'Sign up', type: :submit, class: 'bg-gray-800 hover:bg-gray-700 text-white p-2 w-full font-bold rounded'
            end
          end
        end

        toggle show_on: 'sign_in_failure' do
          plain 'Your email or password is not valid.'
        end
      end

      def title
        h2 'Sign up', class: 'text-4xl font-bold text-gray-800'
      end

      def c_text_input(*args, **opts)
        opts[:class] = 'w-full'
        opts[:errors] = {
          wrapper: { tag: :div, class: 'text-right' }, tag: :div, class: 'text-red-500 text-sm downcase italic'
        }

        div class: 'mb-3' do
          form_input(*args, **opts)
        end
      end

      def form_config
        {
          for: :user,
          method: :post,
          path: registration_path(resource_name),
          success: {
            redirect: {
              follow_response: true
            }
          }
        }
      end

      def user
        resource
      end
  end
end
