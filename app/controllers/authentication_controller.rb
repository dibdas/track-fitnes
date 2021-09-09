class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      puts command.token
      render json: { auth_token: command.token }
    else
      render json: { error: command.user.errors }, status: :unauthorized
    end
  end
 end 