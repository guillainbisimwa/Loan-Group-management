class CreateGrouploans < ActiveRecord::Migration[6.0]
  def change
    create_table :grouploans do |t|

      t.timestamps
    end
  end
end
