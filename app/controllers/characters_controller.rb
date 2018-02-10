class CharactersController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: Character.all }
    end
  end
end