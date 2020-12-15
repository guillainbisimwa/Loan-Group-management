class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }
end
