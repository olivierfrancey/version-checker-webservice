class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :version_number
      t.date :date
      t.string :author
      t.string :checker
      t.string :encrypted_id
      t.boolean :current_version, :default => true
      t.text :comments
      t.string :pdf_file_name
      t.string :dxf_file_name

      t.integer :user_id
      t.integer :project_id
      t.integer :document_id

      t.timestamps
    end
  end
end
