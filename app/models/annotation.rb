class Annotation < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :source, presence: true

  def self.as_type(type)
    type ||= "quote"
    type = type.camelize
    type = "Quote" unless Kernel.const_defined?(type)
    klass = Kernel.const_get(type)
    klass = Quote if klass.is_a?(Annotation)
    klass.new
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

class Audio < Annotation
  validates :url, presence: true

  def default_display_title
    "An Audio File" if persisted?
  end
end

class Song < Annotation
  validates :url, presence: true
end

class Video < Annotation
  validates :url, presence: true
end

class Picture < Annotation
  validates :url, presence: true
end

class Quote < Annotation
  validates :quote, presence: true
end

class Passage < Annotation
  validates :quote, presence: true
end

class Joke < Annotation
  validates :quote, presence: true
end

class Story < Annotation
  validates :quote, presence: true
end