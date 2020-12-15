class AddUserRefToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :author_id, :integer
    add_reference :loans, :users, index: true
    add_foreign_key :loans, :users, column: :author_id
  end
end
