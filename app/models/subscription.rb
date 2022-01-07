class Subscription < ApplicationRecord
  before_validation :generate_title

  belongs_to :tea
  belongs_to :customer

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency

  def generate_title
    tea = Tea.find_by(id: self.tea_id)
    self.title = "#{tea.tyep} - #{self.frequency}"
    return true
  end
end
