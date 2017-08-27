class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true
  validates :content, format: {with: /[(くま)(クマ)(熊)(bear)(ぱんだ)(パンダ)(panda)]/, message: "には「くま」「クマ」「熊」などの語句を含めてください ʕ•ᴥ•ʔ"}
  default_scope {
    Topic.order(:id)
  }
end
