class Grouploan < ApplicationRecord
  belongs_to :loan
  belongs_to :group
end
