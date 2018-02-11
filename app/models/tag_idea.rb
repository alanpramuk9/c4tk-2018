class TagIdea < ApplicationRecord
  belongs_to :idea_board
  belongs_to :tag
end
