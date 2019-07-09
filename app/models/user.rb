class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :registers, inverse_of: :user
  has_many :events, through: :registers
  has_many :posts, inverse_of: :user

  def full_name
    [fname, lname].reject(&:blank?).map(&:capitalize).join(' ')
  end
end
