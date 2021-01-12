class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :grouploans
  has_many :loans, :through => :grouploans
  #has_many :loan_group, foreign_key: :group_id, class_name: 'Grouploan'

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
