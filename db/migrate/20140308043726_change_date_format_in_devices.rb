class ChangeDateFormatInDevices < ActiveRecord::Migration
  def up
	connection.execute(%q{
    	alter table devices
    	alter column next_calibration
    	type date using cast(next_calibration as date)
  	})  end

  def down
  	change_column :devices, :next_calibration, :string
  end
end
