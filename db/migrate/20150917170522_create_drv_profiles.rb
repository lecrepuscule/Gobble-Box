class CreateDrvProfiles < ActiveRecord::Migration
  def change
    create_table :drv_profiles do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
