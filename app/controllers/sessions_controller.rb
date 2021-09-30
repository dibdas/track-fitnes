# rubocop : disable Lint/Syntax
​
class SessionsController < ApplicationController
  skip_before_action :authenticate_request
  prepend SimpleCommand
  def new
    render layout: 'slate'
  end
​
  def create
    @user = User.find_by(email: params[:email])
​
    if @user.authenticate(params:[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: @user.as_json,status:created, token: token
    else
      head(:unauthorized)
    end
  end
​
  def destroy
    sign_out_user
    redirect_to root_path
  end
end

