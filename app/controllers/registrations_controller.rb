# frozen_string_literal: true

# custom registrations controller
class RegistrationsController < Devise::RegistrationsController
  # override default create from devise
  # POST /users
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        redirect_to new_user_session_path(email: resource.email)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render status: 422, json: {
        errors: resource.errors.messages
      }
    end
  end
end
