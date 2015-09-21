class DishesController < ApplicationController

  def index
    data = HTTParty.get "https://api.edamam.com/search?q=#{params[:name]}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_key']}"
    render json: data
  end

  def new
    @dish = Dish.new
  end

  def create
  end


end
