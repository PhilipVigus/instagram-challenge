class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    @user.save
    redirect_to new_user_path, notice: 'Successfully signed up, please log-in'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
