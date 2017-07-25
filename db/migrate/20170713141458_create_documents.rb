class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :identifier
      t.string :title
      t.string :sub_title
      t.string :doc_type
      t.string :size

      t.integer :project_id
      t.integer :user_id

      t.integer :versions_count

      t.timestamps
    end
  end
end
