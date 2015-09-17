class Dish < ActiveRecord::Base
  has_many :intakes
  has_many :users, through: :intakes

  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
end
