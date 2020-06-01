class AddRecipeProductsTable < ActiveRecord::Migration[5.2]
  def change
	create_table :RecipeProducts do |t|
	 t.integer :IDP
	 t.numeric :Weight, precision: 6, scale: 2, null: true
	end
  end
end
