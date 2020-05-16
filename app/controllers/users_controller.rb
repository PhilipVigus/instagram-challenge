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
    likes = Like.where(user_id: logged_in_user.id)
    like_picture_ids = likes.find_each.map { |like| like.picture_id }
    liked_pictures = Picture.where(id: like_picture_ids)
    user_pictures = User.find(params[:id]).pictures

    @pictures = user_pictures.concat liked_pictures
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
