class ChangeStringFormatInDevices < ActiveRecord::Migration
  def up
  	connection.execute(%q{
    	alter table devices
    	alter column calibration_date
    	type date using cast(calibration_date as date)
  	})
  end

  def down
  	change_column :devices, :calibration_date, :string
  end
end
