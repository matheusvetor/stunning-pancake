class Employee < ApplicationRecord
  has_secure_password
  has_many :time_entries
  validates :name, :cpf, presence: true
  validates :cpf, :email, :pis, uniqueness: true

  scope :not_admin, -> { where(is_admin: false) }
end
