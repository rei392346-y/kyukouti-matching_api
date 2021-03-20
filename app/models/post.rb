class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :articles_image
  has_many :comments, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :articles_image, content_type: { in: %w[image/jpeg image/gif image/png], message: '有効な画像形式にしてください' }, size: { less_than: 5.megabytes, message: '5MB未満の画像にしてください' }

  def posts_articles_image
    articles_image.variant(resize_to_limit: [600, 600])
  end

  def users_articles_image
    articles_image.variant(resize_to_limit: [300, 300])
  end

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
