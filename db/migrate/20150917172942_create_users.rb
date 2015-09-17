class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.float :weight
      t.float :height
      t.references :drv_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
