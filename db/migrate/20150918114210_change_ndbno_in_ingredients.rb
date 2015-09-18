class ChangeNdbnoInIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :ndbno, :string
  end
end
