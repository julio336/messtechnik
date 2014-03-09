class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :folio
      t.string :description
      t.string :brand
      t.string :model
      t.string :calibration_date
      t.string :next_calibration
      t.string :deflection
      t.string :responsible
      t.integer :user_id
      t.timestamps
    end
  end
end
