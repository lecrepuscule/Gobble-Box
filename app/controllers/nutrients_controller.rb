class NutrientsController < ApplicationController

  def index 
    @nutrients = Nutrient.all
  end

  def create
    Nutrient.setupNutrients(params[:nutrients].values)
    redirect_to nutrients_path
  end

end
