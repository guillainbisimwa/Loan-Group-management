class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.string :name
      t.float :amout
      t.datetime :createdAt
      t.integer :mounts

      t.timestamps
    end
  end
end
