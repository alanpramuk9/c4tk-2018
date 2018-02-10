class Tag < ApplicationRecord
  default_scope { order(:variant) }

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
