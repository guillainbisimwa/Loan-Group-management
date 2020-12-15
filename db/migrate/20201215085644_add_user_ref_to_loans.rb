class AddUserRefToLoans < ActiveRecord::Migration[6.0]
  def change
    add_reference :loans, :user, null: false, foreign_key: true
  end
end
