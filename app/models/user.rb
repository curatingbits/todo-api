# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :projects
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  before_save :downcase_email
  # before_create :generate_confirmation_instructions

  private

  def downcase_email
    self.email = email.delete(' ').downcase
  end

  # def generate_confirmation_instructions
  #   self.confirmation_token = SecureRandom.hex(10)
  #   self.confirmation_sent_at = Time.now.utc
  # end

  # def confirmation_token_valid?
  #   (self.confirmation_sent_at + 30.days) > Time.now.utc
  # end
  #
  # def mark_as_confirmed!
  #   self.confirmation_token = nil
  #   self.confirmed_at = Time.now.utc
  #   save
  # end
end
