class CommentsController < ApplicationController
  before_action :restrict_route_access

  def create
    comment = Comment.new(comment_params)
    comment.user = logged_in_user
    @picture = Picture.find(params[:picture_id])
    @picture.comments << comment
    redirect_to @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
