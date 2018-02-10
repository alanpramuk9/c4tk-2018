class User < ApplicationRecord
  has_secure_password

  has_many :annotations

  validates :email, uniqueness: { case_sensitive: false }, presence: true

  def self.guest
    Guest.new
  end

  def guest?
    !persisted?
  end

  def build_annotation_of_type(type)
    Annotation.as_type(type).tap { |annotation| annotation.user_id = id }
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

  def errors
    @errors ||= ActiveModel::Errors.new(self)
  end

  def name
    "Honored Guest"
  end
end