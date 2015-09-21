class IntakesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @intakes = @user.intakes
  end

  def new
    @user = User.find(params[:user_id])
    @intake = Intake.new
    binding.pry
    @dish_data = params["dishData"]
    @dish = Dish.new(params)

  end

  def create
  end

end
