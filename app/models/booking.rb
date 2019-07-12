class Booking < ApplicationRecord

  belongs_to :user, inverse_of: :bookings
  belongs_to :event, inverse_of: :bookings
  has_many :guests, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :guests

end
