class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true

  default_scope {
    Topic.order(:id)
  }
end
