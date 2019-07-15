class Dog < ApplicationRecord
  validates :name, presence: true
  mount_uploader :avatar, DogAvatarUploader
end
