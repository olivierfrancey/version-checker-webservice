class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name

      t.integer :user_id
      t.integer :project_id

      t.integer :documents_count, :default => 0
      t.integer :versions_count, :default => 0

      t.timestamps
    end
  end
end
