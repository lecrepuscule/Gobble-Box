class DishesController < ApplicationController

  def index
    @dishes = current_user.get_recommendations
  end


  # def new
  #   @dish = Dish.new
  #   @data = HTTParty.get "https://api.edamam.com/search?q=#{params[:name]}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_key']}"
  #   render json: [@data, current_user.id]
  # end

  def create
    @dish = Dish.new
    data = HTTParty.get "https://api.edamam.com/search?q=#{params[:name]}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_key']}"
    data["hits"].each do |dish_data|
      @dish = Dish.new
      @dish.record(dish_data)
    end
    render json: [data, current_user.id]
  end


end
