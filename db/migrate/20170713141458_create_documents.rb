class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :identifier
      t.string :title
      t.string :sub_title
      t.string :doc_type
      t.string :size
      t.string :last_version, :default => '-'
      t.date :last_version_date
   
      t.integer :user_id
      t.integer :project_id
      t.integer :group_id
      
      t.integer :versions_count, :default => 0

      t.timestamps
    end
  end
end
