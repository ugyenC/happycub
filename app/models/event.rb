class Event < ApplicationRecord
    belongs_to :category
    has_many :users
end
