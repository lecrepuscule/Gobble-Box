class NutrientsController < ApplicationController

  def index 
    @nutrients = Nutrient.all
  end

end
