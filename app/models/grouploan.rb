class Grouploan < ApplicationRecord
  # belongs_to :myloans, foreign_key: :loan_id, class_name: 'Loan'
  # belongs_to :mygroup, foreign_key: :group_id, class_name: 'Group'
  belongs_to :loan
  belongs_to :group
end
