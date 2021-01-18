class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :groups
  has_many :myloans, foreign_key: :author_id, class_name: 'Loan'

  scope :user_all_loans, -> (current_user){ includes(:myloans).find(current_user.id) }
  scope :user_all_loans_count, -> (current_user){ includes(:myloans).find(current_user.id).myloans.count }
  scope :user_all_loans_sum, -> (current_user){ includes(:myloans).find(current_user.id).myloans.sum(:amount) }
end
