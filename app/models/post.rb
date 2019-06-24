class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, length: {minimum: 5}
  validates :body, presence: true

end
