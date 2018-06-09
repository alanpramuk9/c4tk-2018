class IdeaBoard < ApplicationRecord
  belongs_to :user

  has_many :card_ideas
  has_many :cards, through: :card_ideas

  has_many :tag_ideas
  has_many :tags, through: :tag_ideas

  def self.null
    GuestBoard.new
  end

  def card?(card)
    cards.include?(card)
  end

  def add_card(card)
    card_ideas.find_or_create_by(card: card)
  end

  def remove_card(card)
    card_ideas.where(card: card).delete_all
  end

  def empty?
    cards.none?
  end
end

GuestBoard = Naught.build do |config|
  config.impersonate IdeaBoard

  def title
    "Guest User"
  end

  def description
    "Sign in to save your cards."
  end

  def cards
    []
  end
end