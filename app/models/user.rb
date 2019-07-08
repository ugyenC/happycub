class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  after_create :create_profile
  has_many :registers
  has_many :events, through: :registers
  def full_name
    [fname, lname].reject(&:blank?).map(&:capitalize).join(' ')
  end
end
