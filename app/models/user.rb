# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
require 'bcrypt'
class User < ApplicationRecord

  validates :session_token, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :generate_session_token

  attr_reader :password

  def reset_session_token!
    self.session_token = SecureRandom.base64(16)
    self.save!
  end

  def generate_session_token
    self.session_token ||= SecureRandom.base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      user
    end
  end

end
