class LikesController < ApplicationController
  # custom name to reflect the functionality of this method
  # it still isn't ideal, as it maps to the POST method, but
  # it will do for now
  def toggle
    like = Like.find_by(user_id: logged_in_user.id, picture_id: params[:picture_id])
    if like
      remove_like(like)
    else
      add_like(params[:picture_id])
    end
  end

  def remove_like(like)
    like.destroy
  end

  def add_like(picture_id)
    like = Like.new
    like.user = logged_in_user
    picture = Picture.find(picture_id)
    like.picture = picture
    like.save
  end
end
