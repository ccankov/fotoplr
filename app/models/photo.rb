require 'tempfile'

class Photo < ApplicationRecord
  validates :user, presence: true

  has_attached_file :image, styles: {
                              thumb: "200x150#",
                              small: "250x200>",
                              medium: "800x600"
                            },
                            convert_options: {
                              thumb: "-quality 75 -strip"
                            }
  # This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  def take_photo
    cam = Camera.first
    photo = cam.take_photo
    temp_file = Tempfile.new(['temp', '.jpg'], encoding: 'ascii-8bit')

    begin
      temp_file.write(photo)
      self.image = temp_file
    ensure
      temp_file.close
      temp_file.unlink
    end
  end
end
