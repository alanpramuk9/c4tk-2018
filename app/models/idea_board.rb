class IdeaBoard < ApplicationRecord
  belongs_to :user

  has_many :card_ideas
  has_many :cards, through: :card_ideas

  has_many :tag_ideas
  has_many :tags, through: :tag_ideas

  def card?(card)
    cards.include?(card)
  end

  def empty?
    cards.none?
  end
end
