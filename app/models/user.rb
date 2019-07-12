class User < ApplicationRecord
  # include Clearance::User

  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  has_many :bookings, inverse_of: :user
  has_many :events, through: :bookings
  has_many :posts, inverse_of: :user

  def full_name
    [fname, lname].reject(&:blank?).map(&:capitalize).join(' ')
  end

  # def User.authenticate(name, password)
  #   if user = find_by_name(name)
  #     if user.hashed_password == encrypt_password(password, user.salt)
  #       user
  #     end
  #   end
  # end
end
