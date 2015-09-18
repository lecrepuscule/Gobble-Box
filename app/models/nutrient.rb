class Nutrient < ActiveRecord::Base
  has_many :ingredient_nutrients
  has_many :ingredients, through: :ingredient_nutrients

  has_many :drvs
  has_many :drv_profiles, through: :drvs


end
