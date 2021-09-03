class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path, success: 'Successfully created your account'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
