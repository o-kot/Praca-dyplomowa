class AlterTablesAddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :Recipe, :User, column: :IDU
    add_foreign_key :RecipeProducts, :ProductInfo, column: :IDP
    add_foreign_key :CompleteRecipe, :Recipe, column: :IDR
    add_foreign_key :Eaten, :User, column: :IDU
    add_foreign_key :Eaten, :Meal, column: :IDP
    add_foreign_key :Eaten, :ProductInfo, column: :IDPr
    add_foreign_key :Eaten, :CompleteRecipe, column: :IDDR
  end
end
