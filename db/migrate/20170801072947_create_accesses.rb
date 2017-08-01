class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.string :role

      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
