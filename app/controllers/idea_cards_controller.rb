class IdeaCardsController < ApplicationController
  def create
    current_idea_board.add_card(card)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_idea_board.remove_card(card)
    redirect_back(fallback_location: root_path)
  end

protected

  def card
    @card ||= Card.find_by_id(params[:card_id])
  end
end