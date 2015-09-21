class IntakesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @intakes = @user.intakes
  end

  def new
    @user = User.find(params[:user_id])
    @intake = Intake.new
    @dish = Dish.find_by(name: params["dishName"])
  end

  def create
  end

end
