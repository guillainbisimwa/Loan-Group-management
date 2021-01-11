class Grouploan < ApplicationRecord
  # belongs_to :loan
  # belongs_to :group

  belongs_to :member, foreign_key: :group_id, class_name: 'Group'
  belongs_to :credito, foreign_key: :loan_id, class_name: 'Loan'
end
