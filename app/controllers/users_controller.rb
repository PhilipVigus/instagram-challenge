class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      redirect_to '/login', notice: 'Successfully signed up, please log-in'
    else
      flash.now.alert = 'Unable to create new user'
      render :new
    end
  end

  def show
    @pictures = User.find(params[:id]).pictures
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
