class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
