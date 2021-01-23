class AddUserRefToGrouploans < ActiveRecord::Migration[6.0]
  def change
    add_reference :grouploans, :group, null: false, foreign_key: true
    add_reference :grouploans, :loan, null: false, foreign_key: true
  end
end
