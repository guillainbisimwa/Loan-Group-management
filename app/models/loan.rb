class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :creditor, class_name: 'User', foreign_key: :author_id

  has_many :grouploans
  has_many :groups, through: :grouploans
end
