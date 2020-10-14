class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances, source: 'attendee'

  scope :past, -> { where('date < ?', Date.today).order(:date) }
  scope :upcoming, -> { where('date >= ?', Date.today).order(:date) }
end
