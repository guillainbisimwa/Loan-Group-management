class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :creditor, class_name: 'User', foreign_key: :author_id

  belongs_to :group, foreign_key: :group_id, class_name: 'Group'
  has_many :grouploan, foreign_key: :group_id, class_name: 'Grouploan'

end
