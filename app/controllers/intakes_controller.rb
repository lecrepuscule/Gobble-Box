class IntakesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @intakes = @user.intakes
    @intake = Intake.new
    nutrients = @user.current_intake
    @nutrient_intakes = nutrients.sort_by {|k,v| v}
  end

  def new
    @user = User.find(params[:user_id])
    @intake = Intake.new
  end

  def create
    @user = User.find(params[:user_id])
    @intake = @user.intakes.new(intake_params)
    @intake.save
    if request.xhr?
      render js: "window.location = '#{user_intakes_path}'"
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:user_id])
    @intake = Intake.find(params[:id])
    @intake.destroy
    redirect_to user_intakes_path(@user)
  end

  private
  def intake_params
    params.require(:intake).permit(:dish_id, :user_id, :serving, :date)
  end

end
