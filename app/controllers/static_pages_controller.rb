class StaticPagesController < ApplicationController
  def index
  	if user_signed_in?
  		@search = current_user.devices.search(params[:search])
    	@devices = @search.order(sort_column + " " + sort_direction)
    	@devices_nok = current_user.devices.where(status: "NOK")
      @devices_next = current_user.devices.all(:conditions => ["next_calibration >= ?", Time.now-30.days])
  	end
  end

  private
  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "folio"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def next_calibration(user)
    device = []
    user.devices.each do |equipo|
      logger.debug "#{equipo}\n\n\n\n\n\n"
      if Time.now-30.days <= equipo.next_calibration && Time.now >= equipo.next_calibration
        device << equipo
        return device
      end
    end 
  end  

end
