class AddUserRefToGrouploans < ActiveRecord::Migration[6.0]
  def change
    add_reference :grouploans, :user, null: false, foreign_key: true
  end
end
