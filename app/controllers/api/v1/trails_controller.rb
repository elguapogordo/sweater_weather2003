class Api::V1::TrailsController < ApplicationController
  def index
    render json: TrailsSerializer.new(TrailsList.new(params[:location]))
  end
end
