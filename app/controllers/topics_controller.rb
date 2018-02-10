class TopicsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: Topic.all }
    end
  end
end