class SearchController < ApplicationController
  before_action :ensure_valid_params, only: :index

  helper_method :all_results, :results, :card_filtered_search_path

  def index; end

protected

  def card_filtered_search_path(card_type)
    search_path(search_params.merge(card_type: card_type))
  end

  def results
    @results ||=
      begin
        if params.key?(:card_type)
          all_results.of_type(params[:card_type])
        else
          all_results
        end
      end
  end

  def all_results
    canonical_tag.cards
  end

  def canonical_tag
    @canonical_tag ||= variant_tag.canon
  end

  def variant_tag
    @variant_tage ||= Tag.of_type(params[:tag_type]).with_variant(params[:tag]).first
  end

  def ensure_valid_params
    return redirect_to root_path unless params.key?(:tag_type)
    return redirect_to root_path unless params.key?(:tag)
  end

  def search_params
    params.permit(:tag_type, :tag, :card_type).to_h.symbolize_keys
  end
end