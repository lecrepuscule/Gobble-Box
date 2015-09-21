class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    log_in(user)
    redirect_to user_intakes_path(user)
  end

  def destroy
  end

end
