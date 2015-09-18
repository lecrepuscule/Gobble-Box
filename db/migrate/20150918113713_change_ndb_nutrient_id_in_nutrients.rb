class ChangeNdbNutrientIdInNutrients < ActiveRecord::Migration
  def change
    change_column :nutrients, :ndb_nutrient_id, :string
  end
end
