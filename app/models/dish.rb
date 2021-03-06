class Dish < ActiveRecord::Base
  has_many :intakes
  has_many :users, through: :intakes

  has_many :dish_nutrients
  has_many :nutrients, through: :dish_nutrients

  def total_serving
    intakes.inject(0) {|sum, intake| sum += intake.serving}
  end


  def record dish_data
    unless Dish.exists?(name: dish_data["recipe"]["label"])

      name = dish_data["recipe"]["label"]
      image = dish_data["recipe"]["image"]

      per_measure = dish_data["recipe"]["totalWeight"]
      per_measure_unit = "g"
      nutrients = dish_data["recipe"]["totalNutrients"].values
      nutrients_daily = dish_data["recipe"]["totalDaily"].values

      self.update_attributes(name: name, image: image)

      nutrients_daily.each do |nutrient_data| 
        nutrient = Nutrient.new
        nutrient = Nutrient.find_by(name: nutrient_data["label"]) unless nutrient.record nutrient_data

        if nutrient_data["quantity"] > 0
          dish_nutrients.create(nutrient: nutrient, daily_percentage: nutrient_data["quantity"], unit: nutrient_data["unit"],
          per_measure: per_measure,
          per_measure_unit: per_measure_unit)  
        end
      end
    end
    Dish.find_by(name: dish_data["recipe"]["label"])
  end


end
