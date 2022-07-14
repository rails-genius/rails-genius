# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("standard"), not null
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, # use email/password login
         :registerable, # enable registration
         :recoverable, # enable password recovery
         :rememberable, # add option to remember login
         :validatable, # validate the password
         :confirmable, # require users to confirm their email
         :trackable, # track user sign ins
         :omniauthable # use omniauth

  str_enum :role, %i(standard admin)
  has_many :api_keys, dependent: :delete_all

  # @example Get first name
  #   "John Samuel Doe" #=> "John"
  # @return [String, nil]
  def first_name
    split_name.first
  end

  # @example Get last name
  #   "John Samuel Doe" #=> "Doe"
  # @return [String, nil]
  def last_name
    split_name.last
  end

  # Send devise emails using ActiveJob
  # used internally by devise
  #
  # @param [Symbol] notification
  # @param [Array<String, Hash>] args
  # @return [ActionMailer::MailDeliveryJob]
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  class << self
    # access current user globally, available in requests
    # @return [User, nil]
    def current
      RequestStore.store[:current_user]
    end
  end

  private
    # @return [Array<String>]
    def split_name
      @split_name ||= name.split(' ')
    end
end
