class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :grouploan
  has_many :loans, through: :grouploan
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  #belongs_to :user, foreign_key: :user_id, class_name: 'User'

end
