class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]

  helper_method :check_light?, :check_door?, :check_shade?, :check_camera?, :check_ac

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = current_user.rooms.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = current_user.rooms.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = current_user.rooms.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_light?
    @devices_log? @devices_log.light : false
  end

  def check_door?
    @devices_log? @devices_log.door : false
  end

  def check_shade?
    @devices_log? @devices_log.shade : false
  end

  def check_camera?
    @devices_log? @devices_log.camera : false
  end

  def check_ac
    @devices_log? @devices_log.ac : 21
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = current_user.rooms.find(params[:id])
      @devices_log = @room.devices.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :description)
    end
end
