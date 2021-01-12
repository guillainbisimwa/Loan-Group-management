class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  # has_many :grouploan
  # has_many :mygrouploan, foreign_key: :group_id, class_name: 'Loan'
  has_many :loans, foreign_key: :loan_id, class_name: 'Loan'
  has_many :loan_group, foreign_key: :group_id, class_name: 'Grouploan'


  #has_many :mygrouploan, foreign_key: :group_id, class_name: 'Loan'

  #has_many :loans, through: :grouploan
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  #belongs_to :user, foreign_key: :user_id, class_name: 'User'

end
