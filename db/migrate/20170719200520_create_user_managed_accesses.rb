class CreateUserManagedAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_managed_accesses do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :role

      t.timestamps
    end
  end
end
