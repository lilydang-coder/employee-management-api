class Employee < ApplicationRecord
  belongs_to :department

  enum :status, {inactive: 0, active: 1}
  validates :employee_code, uniqueness: true, length: {maximum: 20}, format: {with: /\A[A-Za-z0-9]+\z/}
  validates :full_name, presence: true, length: {maximum: 100}
  validates :hire_date, presence: true
  validates :status, presence: true
  validates :phone, format: {with: /\A[0-9]{9,15}\z/}, allow_blank: true

  before_validation :normalize_name

  private
  def normalize_name
    self.full_name = full_name&.strip
  end
end
