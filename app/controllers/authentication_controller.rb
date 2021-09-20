class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def new
    @user = User.new
  end

  def create
    @user = User.new(:name,:email,:password)

    if @user.save
      render json: {status: 200, msg: "You are currently Logged-in as" success: 'Successfully created your account'}
    else
      render :new
    end
  end

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