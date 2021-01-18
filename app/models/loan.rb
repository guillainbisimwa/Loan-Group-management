class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :creditor, class_name: 'User', foreign_key: :author_id

  has_many :grouploans
  has_many :groups, through: :grouploans

  scope :external_loans, ->(current_user) { includes(:groups).where(creditor:current_user.id, groups: {id:nil}) }
  scope :external_loans_count, ->(current_user) { includes(:groups).where(creditor:current_user.id, groups: {id:nil}).count }
  scope :external_loans_sum, ->(current_user) { includes(:groups).where(creditor:current_user.id, groups: {id:nil}).sum(:amount) }
  
  scope :internal_loans, ->(current_group) { includes(:groups).where(groups: {id:current_group.id}) }
  scope :internal_loans_count, ->(current_group) { includes(:groups).where(groups: {id:current_group.id}).count }
  scope :internal_loans_sum, ->(current_group) { includes(:groups).where(groups: {id:current_group.id}).sum(:amount)  }

end
