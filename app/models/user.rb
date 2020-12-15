class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :loans, dependent: :destroy
  has_many :grouploans, dependent: :destroy
end
