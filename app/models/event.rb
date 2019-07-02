class Event < ApplicationRecord
    belongs_to :category
    has_many :relationships
    has_many :users, through: :relationships
end
