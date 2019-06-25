class Post < ApplicationRecord
  include PublicActivity::Model
  belongs_to :user
  has_one_attached :image
  validates :title, length: {minimum: 5}
  validates :body, presence: true
  
  
  tracked
end
