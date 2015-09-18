class AddNdbIdToNutrients < ActiveRecord::Migration
  def change
    add_column :nutrients, :ndb_id, :integer
  end
end
