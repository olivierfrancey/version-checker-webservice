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
      t.boolean :active
      t.boolean :super_admin, default: false

      t.integer :projects_count,  :default => 0
      t.integer :documents_count, :default => 0
      t.integer :groups_count,    :default => 0
      t.integer :versions_count,  :default => 0
      t.integer :accesses_count,  :default => 0
      t.integer :qr_code_positions_count, :default => 0

      t.timestamps
    end
  end
end
