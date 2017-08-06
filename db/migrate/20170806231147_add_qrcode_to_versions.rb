class AddQrcodeToVersions < ActiveRecord::Migration[5.1]
  def change
    add_column :versions, :qrcode, :string
  end
end
