class Nutrient < ActiveRecord::Base
  has_many :dish_nutrients
  has_many :dishes, through: :dish_nutrients

  has_many :drvs
  has_many :drv_profiles, through: :drvs

  def record nutrient_data
    Nutrient.exists?(name: nutrient_data["label"]) ? false : update_attributes(name: nutrient_data["label"]) 
  end

end
