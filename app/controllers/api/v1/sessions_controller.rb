class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    unless user.nil?
      if user.authenticate(params[:password])
        render json: UsersSerializer.new(user)
      else
        render json: { error: 'Password authentication failed' }, status: 400
      end
    else
      render json: { error: 'User not found' }, status: 400
    end
  end
end
