# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dp1 = DrvProfile.create(name: "test")

dp1.drvs.create()

Nutrient.find_by(name: "Energy").drvs.create(quantity: 2000, unit: "kcal", drv_profile: DrvProfile.find(1))

DrvProfile.find(1).users.create(name: "Yao")

d1 = Dish.create(name: "Grilled Deviled Chickens Under a Brick")

