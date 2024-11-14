class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for(@user)
      redirect_to after_authentication_url, notice: "Welcome!"
    else
      flash.now[:alert] = "There was a problem creating your account."
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
