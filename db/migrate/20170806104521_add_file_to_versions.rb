class AddFileToVersions < ActiveRecord::Migration[5.1]
  def change
    add_column :versions, :file, :string
  end
end
