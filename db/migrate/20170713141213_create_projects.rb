class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :identifier
      t.string :address
      t.string :npa
      t.string :city
      t.string :country
      t.string :client_name
      t.string :client_address
      t.string :client_npa
      t.string :client_city
      t.string :client_country
      
      t.integer :user_id

      t.integer :groups_count,    :default => 0
      t.integer :documents_count, :default => 0
      t.integer :versions_count,  :default => 0
      t.integer :accesses_count,  :default => 0

      t.timestamps
    end
  end
end
