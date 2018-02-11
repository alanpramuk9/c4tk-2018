class Tag < ApplicationRecord
  has_many :card_tags
  has_many :cards, through: :card_tags

  scope :of_type, ->(type) { where(type: type) }

  default_scope { order(:variant) }

  def self.select_options
    all.map { |tag| [tag.variant, tag.canonical_name] }
  end

  def as_json(**options)
    super(options.merge(only: %w(id canonical_name variant)))
  end
end

class TheologicalTheme < Tag
end

class Topic < Tag
end

class Character < Tag
end
