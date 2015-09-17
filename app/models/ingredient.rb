class Ingredient < ActiveRecord::Base
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  has_many :ingredient_nutrients
  has_many :nutrients, through: :ingredient_nutrients
end
