class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :company
      t.string :discipline

      t.integer :projects_count
      t.integer :documents_count
      t.integer :versions_count

      t.timestamps
    end
  end
end
