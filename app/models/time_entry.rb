class TimeEntry < ApplicationRecord
  belongs_to :employee
  validates :employee, presence: true
end
