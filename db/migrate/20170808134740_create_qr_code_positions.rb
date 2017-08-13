class CreateQrCodePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :qr_code_positions do |t|
      t.integer :page
      t.integer :x
      t.integer :y
      t.integer :size
      t.string :name

      t.integer :user_id
      t.integer :documents_count, :default => 0

      t.timestamps
    end
  end
end
