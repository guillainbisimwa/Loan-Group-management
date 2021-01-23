class Loan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_float: true }

  belongs_to :creditor, class_name: 'User', foreign_key: :author_id

  has_many :grouploans
  has_many :groups, through: :grouploans

  scope :ex_loans, ->(user) { includes(:groups).where(creditor: user.id, groups: { id: nil }).order(created_at: :desc) }
  scope :external_loans_count, ->(user) { includes(:groups).where(creditor: user.id, groups: { id: nil }).count }
  scope :external_loans_sum, ->(user) { includes(:groups).where(creditor: user.id, groups: { id: nil }).sum(:amount) }

  scope :internal_loans, ->(group) { includes(:groups).where(groups: { id: group.id }).order(created_at: :desc) }
  scope :internal_loans_count, ->(group) { includes(:groups).where(groups: { id: group.id }).count }
  scope :internal_loans_sum, ->(group) { includes(:groups).where(groups: { id: group.id }).sum(:amount) }
end
