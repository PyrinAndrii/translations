class Post < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader
  validates :title, :description, :content, presence: true

  # Tags set
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  # Tags get
  def all_tags
    self.tags.map(&:name).join(', ')
  end
end
