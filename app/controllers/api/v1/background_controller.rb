class Api::V1::BackgroundController < ApplicationController
  def index
    render json: BackgroundSerializer.new(Background.new(params[:location]))
  end
end
