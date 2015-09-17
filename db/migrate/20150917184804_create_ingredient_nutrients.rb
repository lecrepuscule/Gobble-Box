class CreateIngredientNutrients < ActiveRecord::Migration
  def change
    create_table :ingredient_nutrients do |t|
      t.float :quantity
      t.float :per_measure
      t.references :nutrient, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
