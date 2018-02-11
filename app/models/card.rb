class Card < ApplicationRecord
  TYPES = %w(Song Audio Video Picture Quote Passage Joke Story).sort

  belongs_to :user
  has_many :card_tags
  has_many :tags, through: :card_tags

  scope :of_type, ->(type) { where(type: type) }

  validates :user, presence: true

  def self.as_type(type)
    type ||= "Quote"
    type = type.camelize
    type = "Quote" unless Kernel.const_defined?(type)
    klass = Kernel.const_get(type)
    klass = Quote if klass.is_a?(Card)
    klass.new
  end

  def add_tag(tag)
    card_tags.find_or_create_by(tag: tag)
  end

  def remove_tag(tag)
    card_tags.where(tag: tag).delete_all
  end

  def type_identifier
    type.downcase
  end

  def display_title
    title || default_display_title
  end

  def default_display_title
    "A #{type}" if persisted?
  end
end

class Audio < Card
  validates :url, presence: true

  def default_display_title
    "An Audio File" if persisted?
  end
end

class Song < Card
  validates :url, presence: true
end

class Video < Card
  validates :url, presence: true
end

class Picture < Card
  validates :url, presence: true
end

class Quote < Card
  validates :author, presence: true
  validates :quote, presence: true
end

class Passage < Card
  validates :author, presence: true
  validates :source, presence: true
  validates :quote, presence: true
end

class Joke < Card
  validates :quote, presence: true
end

class Story < Card
  validates :quote, presence: true
end