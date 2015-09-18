namespace :nutrients do
  desc "Gets the nutrient data from ndb and inserts in to database"
  task get: :environment do

    offset = 0
    total = 50
    
    until offset >= total do 

      data = HTTParty.get "http://api.nal.usda.gov/ndb/list?format=json&lt=n&offset=#{offset}&sort=n&api_key=#{ENV['ndb_key']}"

      offset += 50
      total = data["list"]["total"]

      data["list"]["item"].each do |nutrient|
        Nutrient.create(name: nutrient["name"], ndb_nutrient_id: nutrient["id"]) unless Nutrient.find_by(ndb_nutrient_id: nutrient["id"])      
      end
      puts "#{data["list"]["end"] - data["list"]["start"]} has been inserted into db"

    end

    puts "total nutrients in DB is #{Nutrient.all.count}"

  end
end
