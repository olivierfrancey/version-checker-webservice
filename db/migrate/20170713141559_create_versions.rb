class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.numeric :version_number
      t.date :date
      t.string :author
      t.string :checker
      t.string :crypted_id
      t.boolean :current_version
      t.text :comments

      t.belongs_to :user, index: true
      t.belongs_to :document, index: true

      t.timestamps
    end
  end
end
