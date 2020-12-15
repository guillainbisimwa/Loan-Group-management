class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :grouploan
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
