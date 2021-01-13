class AddUserRefToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :author_id, :integer
    add_foreign_key :loans, :users, column: :author_id, index: true
  end
end
