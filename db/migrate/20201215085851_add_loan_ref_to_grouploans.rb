class AddLoanRefToGrouploans < ActiveRecord::Migration[6.0]
  def change
    add_reference :grouploans, :loan, null: false, foreign_key: true
  end
end
