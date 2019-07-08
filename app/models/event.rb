class Event < ApplicationRecord

  belongs_to :category
  has_many :registers
  has_many :users, through: :registers

  def readable_date
    I18n.l start_date, format: :long
  end

  def attended_by(id, event)
    event.users.pluck(:user_id).include? id
  end

  def self.upcoming
    where('start_date >= ?', DateTime.current)
  end

  def self.previous
    where('start_date < ?', DateTime.current)
  end

  def self.current
    where('start_date = ?', Date.today)
  end

end
