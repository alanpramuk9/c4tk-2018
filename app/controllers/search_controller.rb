class SearchController < ApplicationController
  before_action :ensure_valid_params, only: :index

  helper_method :results

  def index; end

protected

  def results
    @results ||=
      begin
        results = canonical_tag.cards
        if params.key?(:card_type)
          results.of_type(params[:card_type])
        else
          results
        end
      end
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
end