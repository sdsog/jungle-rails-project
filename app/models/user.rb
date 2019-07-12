# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :name, presence: true

  def self.credentials_checker(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
    user if user&.authenticate(password)
  end
end
