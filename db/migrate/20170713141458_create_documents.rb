class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :identifier
      t.string :title
      t.string :sub_title
      t.string :doc_type
      t.string :size
      t.string :version_format

      t.timestamps
    end
  end
end
