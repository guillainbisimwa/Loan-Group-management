class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :grouploan
end
