namespace :ingredient_nutrients do
  desc "Gets the nutrient list for each ingredient from ndb and inserts in to database"
  task get: :environment do

    def exist? (ingredient, nutrient)
      ingredient.nutrients.each {|n| return true if n.ndb_nutrient_id == nutrient["nutrient_id"]}
      false
    end


    Ingredient.all.each do |ingredient|

      unless ingredient.ingredient_nutrients ==[]

        data = HTTParty.get "http://api.nal.usda.gov/ndb/reports/?ndbno=#{ingredient.ndbno}&type=b&format=json&api_key=#{ENV['ndb_key']}"

        if data.first.class == Array

          puts "#{ingredient.name} has nutrients..."

          data["report"]["food"]["nutrients"].each do |nutrient|
            my_nutrient = Nutrient.find_by(ndb_nutrient_id: nutrient["nutrient_id"])
            quantity = nutrient["value"].to_f
            unit = nutrient["unit"]
            per_measure = 100.to_f
            per_measure_unit = "g"

            puts "#{nutrient["name"]}"
            
            my_nutrient.ingredient_nutrients.create(
              quantity: quantity,
              unit: unit,
              per_measure: per_measure,
              per_measure_unit: per_measure_unit,
              ingredient: ingredient
            ) if quantity > 0 && !exist?(ingredient, nutrient)
          end
        else 
          logger.debug("ndb has returned bad data for #{ingredient.name}")
        end
      end
    end

      puts "total ingredient_nutrients in DB is #{IngredientNutrient.all.count}"

  end
end
