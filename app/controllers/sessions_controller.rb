class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      login(user)
      redirect_to photos_url
    else
      flash[:errors] = ['Invalid username or password']
      redirect_to new_session_url
    end
  end

  def destroy
    logout if current_user
    redirect_to photos_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
