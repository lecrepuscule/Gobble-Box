class AddUnitToIngredientNutrients < ActiveRecord::Migration
  def change
    add_column :ingredient_nutrients, :unit, :string
    add_column :ingredient_nutrients, :per_measure_unit, :string
  end
end
