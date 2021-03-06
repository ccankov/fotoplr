class PhotoMailer < ApplicationMailer
  default from: 'Fotoplr <photos@fotoplr.com>'

  def photo_email(photo, user)
    @user = user
    @photo = photo
    mail(to: user.email, subject: 'Your free Fotoplr photo')
  end
end
