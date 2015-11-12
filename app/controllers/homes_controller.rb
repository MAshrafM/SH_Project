class HomesController < ApplicationController
	skip_before_action :ensure_login, only: [:index, :new, :create]
  def index
  end
  
  def new
  end
  
  def create
	user = User.find_by(username: params[:user][:username])
	password = params[:user][:password]
	
	if user && user.authenticate(password)
		session[:user_id] = user.id
		redirect_to rooms_path, notice: "Logged in successfully"
	else
		redirect_to login_path, alert: "Invaled Username/Password"
	end
  end
  
  def destroy
	reset_session
	redirect_to login_path, notice: "You have Logged Out"
  end
end
