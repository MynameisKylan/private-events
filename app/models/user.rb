class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: 'attended_event'
end
