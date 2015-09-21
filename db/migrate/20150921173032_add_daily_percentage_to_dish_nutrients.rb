class AddDailyPercentageToDishNutrients < ActiveRecord::Migration
  def change
    add_column :dish_nutrients, :daily_percentage, :float
  end
end
