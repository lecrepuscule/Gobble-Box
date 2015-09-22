class Nutrient < ActiveRecord::Base
  has_many :dish_nutrients
  has_many :dishes, through: :dish_nutrients

  def record nutrient_data
    Nutrient.exists?(name: nutrient_data["label"]) ? false : update_attributes(name: nutrient_data["label"]) 
  end

end
