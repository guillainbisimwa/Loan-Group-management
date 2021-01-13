class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.datetime :createdAt

      t.timestamps
    end
  end
end
