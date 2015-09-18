class AddUnitToDrvs < ActiveRecord::Migration
  def change
    add_column :drvs, :unit, :string
  end
end
