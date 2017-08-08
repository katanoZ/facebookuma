class Topic < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true
end
