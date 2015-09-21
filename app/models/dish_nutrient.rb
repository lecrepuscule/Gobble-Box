class DishNutrient < ActiveRecord::Base
  belongs_to :nutrient
  belongs_to :dish

  

end
