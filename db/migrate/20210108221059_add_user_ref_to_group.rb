class AddUserRefToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :user, index: true
  end
end
