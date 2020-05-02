class AlterTableRecipeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :RecipeProducts, :IDR, :int
    add_foreign_key :RecipeProducts, :Recipe, column: :IDR
  end
end
