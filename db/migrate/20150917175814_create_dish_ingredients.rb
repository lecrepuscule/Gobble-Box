class CreateDishIngredients < ActiveRecord::Migration
  def change
    create_table :dish_ingredients do |t|
      t.float :quantity
      t.float :per_measure
      t.references :dish, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
