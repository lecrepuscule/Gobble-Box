class IntakesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @intakes = @user.intakes
  end

  def new
    @user = User.find(params[:user_id])
    @intake = Intake.new
  end

  def create
    @user = User.find(params[:user_id])
    @intake = @user.intakes.new(intake_params)
    if @intake.save
      redirect_to user_intakes_path(@user)
    end
  end

  private
  def intake_params
    params.require(:intake).permit(:dish_id, :user_id, :serving, :date)
  end

end
