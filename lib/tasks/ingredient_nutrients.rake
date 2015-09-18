namespace :ingredient_nutrients do
  desc "Gets the nutrient list for each ingredient from ndb and inserts in to database"
  task get: :environment do

    # Ingredient.all.each do |ingredient|
      ingredient = Ingredient.find(2000)
      data = HTTParty.get "http://api.nal.usda.gov/ndb/reports/?ndbno=#{ingredient.ndbno}&type=b&format=json&api_key=#{ENV['ndb_key']}"

      data["report"]["food"]["nutrients"].each do |nutrient|
        ["nutrient_id"]
      end
      binding.pry

      # data["list"]["item"].each do |nutrient|
      #   IngredientNutrient.create(name: nutrient["name"], ndb_nutrient_id: nutrient["id"]) unless IngredientNutrient.find_by(ndb_nutrient_id: nutrient["id"])      
      # end

      puts "total ingredient_nutrients in DB is #{IngredientNutrient.all.count}"
    # end
  end
end
