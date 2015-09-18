class AddUnitToDishIngredients < ActiveRecord::Migration
  def change
    add_column :dish_ingredients, :unit, :string
    add_column :dish_ingredients, :per_measure_unit, :string
  end
end
