class Photo < ApplicationRecord
  validates :user, :title, presence: true

  has_attached_file :image
  # This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
end
