class StaticPagesController < ApplicationController
  def index
  	if user_signed_in?
  		@devices = current_user.devices 
  	end
  end
end
