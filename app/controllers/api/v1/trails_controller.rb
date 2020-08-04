class Api::V1::TrailsController < ApplicationController
  def index
    render json: TrailSerializer.new(TrailList.new(params[:location]))
  end
end
