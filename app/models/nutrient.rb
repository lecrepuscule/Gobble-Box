class Nutrient < ActiveRecord::Base
  has_many :ingredient_nutrients
  has_many :ingredients, through: :ingredient_nutrients

  has_many :drvs
  has_many :drv_profiles, through: :drvs

  def self.setupNutrients nutrients
    nutrients.each do |nutrient|
      Nutrient.create(name: nutrient[:name], ndb_nutrient_id: nutrient[:id]) unless Nutrient.find_by(ndb_nutrient_id: nutrient[:id])
    end  
    [200, {"Content-Type" => "application/json"}, {status: 'ok'}].to_json if request.xhr?
  end


end
