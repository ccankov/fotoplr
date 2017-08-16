class PhotosController < ApplicationController
  before_action :logged_in?

  def index
    @photos = current_user.photos
    @photo = Photo.new
    render :index
  end

  def new
    @photo = Photo.new
    render :new
  end

  def create
    @photo = Photo.new(user_id: current_user.id)
    @photo.take_photo
    if @photo.save
      msg = PhotoMailer.photo_email(@photo, current_user)
      msg.deliver_now
      redirect_to photos_url
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to new_photo_url
    end
  end
end
