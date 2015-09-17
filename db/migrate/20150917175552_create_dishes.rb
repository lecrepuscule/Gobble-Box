class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
