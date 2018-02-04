class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true

  def self.guest
    Guest.new
  end

  def guest?
    !persisted?
  end
end

Guest = Naught.build do |config|
  config.impersonate User

  def self.with_invalid_email
    new.tap { |user| user.errors.add(:email, "We need a valid email here.") }
  end

  def nil?
    true
  end

  def guest?
    true
  end

  def email
    nil
  end

  def password
    nil
  end

  def name
    "Honored Guest"
  end
end