class Post < ApplicationRecord
  include PublicActivity::Model
  belongs_to :user, inverse_of: :posts
  has_one_attached :image
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  def creation_time
    (Time.current - created_at)
  end
end
