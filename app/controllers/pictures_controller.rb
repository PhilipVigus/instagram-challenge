class PicturesController < ApplicationController
  def new
  end

  def index
    @pictures = Picture.all
  end

  def create
    if params[:picture] == nil
      redirect_to new_picture_path, alert: "You must choose a picture to upload"
    else
      @picture = Picture.new(picture_params)
      @picture.save
      redirect_to pictures_path
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:picture)
  end
end
