class Employee < ApplicationRecord
  has_many :time_entries
  validates :name, :cpf, presence: true
end
