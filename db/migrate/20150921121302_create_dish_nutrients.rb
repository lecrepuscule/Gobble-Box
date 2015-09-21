class CreateDishNutrients < ActiveRecord::Migration
  def change
    create_table :dish_nutrients do |t|
      t.references :nutrient, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true
      t.float :quantity
      t.string :unit
      t.float :per_measure
      t.string :per_measure_unit

      t.timestamps null: false
    end
  end
end
