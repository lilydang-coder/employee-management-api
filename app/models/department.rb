class Department < ApplicationRecord
  has_many :employees, dependent: :restrict_with_error

  enum :status, {inactive: 0, active: 1}
  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :status, presence: true
  validates :description, length: {maximum: 500}

  before_validation :normalize_name

  private
  def normalize_name
    self.name = name&.strip
  end
end
