class CardIdea < ApplicationRecord
  belongs_to :idea_board
  belongs_to :card
end
