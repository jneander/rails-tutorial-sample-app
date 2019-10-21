class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :image,
            content_type: {
              in: %w[image/jpeg image/gif image/png],
              message: "must be a supported image format"
            },
            size: {
              less_than: 5.megabytes,
              message: "must be less than 5MB"
            }

  default_scope -> { order(created_at: :desc) }
end
