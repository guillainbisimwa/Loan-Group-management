class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :myloans, foreign_key: :author_id, class_name: 'Loan'
end
