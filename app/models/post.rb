class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :title, :description, :content, presence: true
end
