class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname, uniqueness: true
  validates :nickname, format: { with: /\A[a-zA-Z]+\z/,
            message: "only allows letters" }
  validates :nickname, length: { in: 3..16 }

  mount_uploader :avatar, AvatarUploader


end
