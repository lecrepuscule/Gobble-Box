class AddNdbnoToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ndbno, :integer
  end
end
