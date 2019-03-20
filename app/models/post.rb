class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader
  validates :title, :description, :content, presence: true
end
