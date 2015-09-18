class RenameNdbIdInNutrients < ActiveRecord::Migration
  def change
    rename_column :nutrients, :ndb_id, :ndb_nutrient_id
  end
end
