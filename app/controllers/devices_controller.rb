class DevicesController < ApplicationController
	before_action :set_room
	
	def index
	end
	
	def show
	end
	
	def create
	  @device = @room.devices.new(room_params)
	  if @device.save
		redirect_to @room, notice: "Successfuly updated"
	  else
		redirect_to @room, alert: "Unable to update"
	  end
	end
	
	private
	  def set_room
	    @room = Room.find(params[:room_id])
	  end
	  
	  def room_params
	    params.require(:device).permit(:light, :ac, :shade, :camera, :door)
	  end
end
