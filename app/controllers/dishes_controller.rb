class DishesController < ApplicationController

  def new
    @dish = Dish.new
    data = HTTParty.get "https://api.edamam.com/search?q=#{params[:name]}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_key']}"
    binding.pry
  end


end
