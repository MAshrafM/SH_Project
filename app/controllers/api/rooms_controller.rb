module API
  class RoomsController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :ensure_login, only: [:show]
	before_action :set_room
	
	def show
	  devices_log = @room.devices.last
	  render json: devices_log, status: :ok
	end
	
	private
	  def set_room
		@room = Room.find(params[:id])
	  end
  
  end
end