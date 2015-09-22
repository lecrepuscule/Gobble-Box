class DishesController < ApplicationController

  def index
    @dishes = current_user.get_recommendations
  end


  def create
    @dish = Dish.new
    data = HTTParty.get "https://api.edamam.com/search?q=#{params[:q]}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_key']}"
    response = data["hits"].map do |dish_data|
      @dish = Dish.new
      outcomes = @dish.record(dish_data)
    end
    if request.xhr?
      render json: [response, current_user.id]
    end
  end


end
