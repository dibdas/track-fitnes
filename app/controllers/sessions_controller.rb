class SessionsController < ApplicationController
  def new
    render layout: 'slate'
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      @current_user= @user
      sign_in(@user)
   
    else
      flash.now[:error] = 'Invalid name'
      render :new
    end
  end

  def destroy
    sign_out_user
    redirect_to root_path
  end
end
