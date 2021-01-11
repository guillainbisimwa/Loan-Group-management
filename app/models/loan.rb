class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :user, foreign_key: :author_id, class_name: 'User'

  has_many :grouploan, dependent: :destroy
  has_many :groups, through: :grouploan

end
