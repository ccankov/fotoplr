class PhotosController < ApplicationController
  before_action :logged_in?

  def index
    @photos = current_user.photos
    render :index
  end
end
