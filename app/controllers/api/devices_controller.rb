module API
  class DevicesController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :ensure_login, only: [:create]
	skip_before_action :verify_authenticity_token
	before_action :set_room
	
	def create
	  @device = @room.devices.new(room_params)
	  if @device.save
		render json: @device, status: :created
	  else
		render json: @device.errors, status: :unprocessable_entity
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
end