class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :identifier
      t.string :address
      t.string :npa
      t.string :city
      t.string :country
      t.string :bill_option
      t.string :client_name
      t.string :client_address
      t.string :client_npa
      t.string :client_city
      t.string :client_country
      
      t.integer :user_id
      t.integer :documents_count
      t.integer :versions_count
      t.integer :users_count

      t.timestamps
    end
  end
end
