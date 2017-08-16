class Camera < ApplicationRecord
  validates :mac, :ip, presence: true
  validates :mac, :ip, uniqueness: true

  def take_photo
    open("http://#{self.ip}/api").read
  end
end
