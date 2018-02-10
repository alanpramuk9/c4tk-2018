class TheologicalThemesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: TheologicalTheme.all }
    end
  end
end