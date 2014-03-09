class ChangeDateFormatInDevices < ActiveRecord::Migration
  def up
  	change_column :devices, :next_calibration, :date
  end

  def down
  	change_column :devices, :next_calibration, :string
  end
end
