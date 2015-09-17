class CreateDrvs < ActiveRecord::Migration
  def change
    create_table :drvs do |t|
      t.float :quantity
      t.references :nutrient, index: true, foreign_key: true
      t.references :drv_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
