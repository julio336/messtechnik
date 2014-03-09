class ChangeStringFormatInDevices < ActiveRecord::Migration
  def up
   change_column :devices, :calibration_date, :date
  end

  def down
  	change_column :devices, :calibration_date, :string
  end
end
