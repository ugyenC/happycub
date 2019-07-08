class Register < ApplicationRecord

  belongs_to :user, inverse_of: :registers
  belongs_to :event, inverse_of: :registers
  has_many :guests, inverse_of: :register, dependent: :destroy
  accepts_nested_attributes_for :guests

end
