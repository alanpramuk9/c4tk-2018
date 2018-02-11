class CardsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_valid_card_type

  helper_method :card

  def new; end

  def create
    card.assign_attributes(card_params)
    if card.save
      redirect_to card_path(card)
    else
      render :new
    end
  end

  def show; end

  def edit
    render :new
  end

  def update
    card.assign_attributes(card_params)
    if card.save
      redirect_to card_path(card)
    else
      render :new
    end
  end

  def destroy
    card.destroy if card.user == current_user
    redirect_to profile_path
  end

private

  def card_params
    params
      .require(:card)
      .permit(
        :id, :type, :user_id, :title, :description,
        :quote, :url, :source, :author, :location,
        :private, :review_status, :censored
      )
  end

  def ensure_valid_card_type
    if params[:type].present? && params[:type] != card.type_identifier
      redirect_to new_card_path(card.type_identifier)
    end
  end

  def card
    @card ||= Card.find_by_id(params[:id])
    @card ||= current_user.build_card_of_type(card_type)
  end

  def card_type
    params[:type] || params[:card][:type]
  end
end