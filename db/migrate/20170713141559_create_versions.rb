class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :version_number
      t.date :date
      t.string :author
      t.string :checker
      t.string :crypted_id
      t.boolean :current_version
      t.text :comments

      t.integer :user_id
      t.integer :project_id
      t.integer :group_id
      t.integer :document_id

      t.timestamps
    end
  end
end
