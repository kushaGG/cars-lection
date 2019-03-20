class Photo < ApplicationRecord
  mount_uploaders :images, PhotoUploader
  serialize :images, JSON # If you use SQLite, add this line.

  belongs_to :user
  has_one :category
end
