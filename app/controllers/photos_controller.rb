class PhotosController < ApplicationController
  before_action :logged_in?

  def index
    @photos = current_user.photos
    render :index
  end

  def new
    @photo = Photo.new
    render :new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_url
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to new_photo_url
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
