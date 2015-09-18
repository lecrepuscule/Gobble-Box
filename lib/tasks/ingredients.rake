namespace :ingredients do
  desc "Gets the ingredient data from NDB and inserts in to database"
  task get: :environment do

    offset = 0
    total = 8617
    
    until offset >= total do 

      data = HTTParty.get "http://api.nal.usda.gov/ndb/list?format=json&lt=f&offset=#{offset}&sort=n&api_key=#{ENV['ndb_key']}"

      offset += 50
      data["list"]["item"].each do |ingredient|
        Ingredient.create(name: ingredient["name"], ndbno: ingredient["id"]) unless Ingredient.find_by(ndbno: ingredient["id"])      
      end

    end

    puts "total ingredients in DB is #{Ingredient.all.count}"

  end
end
