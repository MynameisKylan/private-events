class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'
end
