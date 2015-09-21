class Dish < ActiveRecord::Base
  has_many :intakes
  has_many :users, through: :intakes

  has_many :dish_nutrients
  has_many :nutrients, through: :dish_nutrients


  def record dish_data
    unless Dish.exists? dish_data["recipe"]["label"]
      name = dish_data["recipe"]["label"]
      image = dish_data["recipe"]["image"]

      per_measure = dish_data["recipe"]["totalWeight"]
      per_measure_unit = "g"
      nutrients = ["recipe"]["totalNutrients"].values

      self.update_attributes(name: name, image: image)

      nutrients.each do |nutrient_data| 
        nutrient = Nutrient.new
        nutrient = Nutrient.find_by(name: nutrient_data["label"]) unless nutrient.record nutrient_data

        if nutrient_data["quantity"] > 0
          dish_nutrients.create(nutrient: nutrient, quantity: nutrient_data["quantity"], unit: nutrient_data["unit"],
          per_measure: per_measure,
          per_measure_unit: per_measure_unit)  
        end
      end
    end
  end


end
