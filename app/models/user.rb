require 'securerandom'
class User < ApplicationRecord
  before_create :get_api_key
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, on: :create

  has_secure_password

  private

  def get_api_key
    self.api_key = SecureRandom.hex
  end
end
