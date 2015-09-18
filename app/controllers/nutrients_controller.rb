class NutrientsController < ApplicationController

  def index 
    @nutrients = Nutrient.all
  end

  def create
  end

end
