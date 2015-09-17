class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.float :serving
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
