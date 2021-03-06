class Event < ApplicationRecord

  has_one_attached :post_image
  has_many :bookings, inverse_of: :event, dependent: :destroy
  has_many :users, through: :bookings

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :location, presence: true

  def readable_start_date
    I18n.l start_date, format: :long
  end
  def readable_end_date
    I18n.l end_date, format: :long
  end

  def attended_by(id, event)
    event.users.pluck(:user_id).include? id
  end

  def self.upcoming
    where('start_date >= ?', DateTime.current)
  end

  def self.previous
    where('end_date < ?',DateTime.current)
  end

  def self.current
    where('start_date < ?', DateTime.current).where('end_date > ?' , DateTime.current)
  end

end
