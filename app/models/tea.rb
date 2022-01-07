class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  validates_presence_of :tyep
  validates :tyep, uniqueness: true
  validates_presence_of :description
  validates_presence_of :temperature
  validates_presence_of :brew_time
end
