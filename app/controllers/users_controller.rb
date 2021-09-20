class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show]


  private

  def user_params
    params.require(:user).permit(:name,:eamil,:password)
  end
end
