class Guest < ApplicationRecord
  belongs_to :register

  validates :fname, presence: true, length: {maximum: 100}
  validates :lname, presence: true, length: {maximum: 100}
  validates :age, inclusion: {in: 12..50}
  validates :age, numericality: true

  def full_name
    [fname, lname].reject(&:blank?).map(&:capitalize).join(' ')

  end
end
