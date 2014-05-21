class StaticPagesController < ApplicationController
  def index
  	if user_signed_in?
  		@search = current_user.devices.search(params[:search])
    	@devices = @search.order(sort_column + " " + sort_direction)
    	@devices_nok = current_user.devices.where(status: "NOK")
      @devices_next = next_calibration(current_user.devices)
  	end
  end

  private
  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "folio"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def next_calibration(devices)
    device = []
    devices.each do |x|
      if Time.now-30.days < x.next_calibration
        device.push(x)
      end
      return device
    end 
  end  

end
