class AddCompleteRecipeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :CompleteRecipe do |t|
      t.integer :IDR
      t.boolean :IsActive
      t.boolean :HasPortions
      t.integer :HowManyPortions, null: true
      t.boolean :IsWeighted
      t.float :Weight, precission: 6, scale: 2, null: true
      t.float :WhatIsLeft, precission: 6, scale: 2 
      t.float :Calories, precission: 6, scale: 2 
      t.float :Protein, precission: 5, scale: 2 
      t.float :Carbs, precission: 6, scale: 2 
      t.float :Fat, precission: 5, scale: 2
      t.float :Sugars, precission: 4, scale: 2, null: true  
      t.float :Fiber, precission: 4, scale: 2, null: true 
      t.float :Omega3, precission: 4, scale: 2, null: true 
      t.float :ALA, precission: 4, scale: 2, null: true 
      t.float :SFA, precission: 4, scale: 2, null: true 
      t.float :WNKT, precission: 4, scale: 2, null: true 
      t.float :Trans, precission: 4, scale: 2, null: true       
      t.float :Valine, precission: 4, scale: 2, null: true 
      t.float :Isoleucine, precission: 4, scale: 2, null: true 
      t.float :Leucine, precission: 4, scale: 2, null: true 
      t.float :Lysine, precission: 4, scale: 2, null: true 
      t.float :Methionine, precission: 4, scale: 2, null: true 
      t.float :Threonine, precission: 4, scale: 2, null: true 
      t.float :Tryptophan, precission: 4, scale: 2, null: true 
      t.float :Phenylalanine, precission: 4, scale: 2, null: true 
      t.float :VitA, precission: 4, scale: 2, null: true 
      t.float :VitB1, precission: 4, scale: 2, null: true 
      t.float :VitB2, precission: 4, scale: 2, null: true 
      t.float :VitB3, precission: 4, scale: 2, null: true 
      t.float :VitB4, precission: 4, scale: 2, null: true 
      t.float :VitB5, precission: 4, scale: 2, null: true 
      t.float :VitB6, precission: 4, scale: 2, null: true 
      t.float :VitB9, precission: 4, scale: 2, null: true 
      t.float :VitB12, precission: 4, scale: 2, null: true 
      t.float :VitC, precission: 4, scale: 2, null: true 
      t.float :VitD, precission: 4, scale: 2, null: true 
      t.float :VitE, precission: 4, scale: 2, null: true 
      t.float :VitH, precission: 4, scale: 2, null: true 
      t.float :VitK, precission: 4, scale: 2, null: true 
      t.float :Cl, precission: 4, scale: 2, null: true 
      t.float :Zn, precission: 4, scale: 2, null: true 
      t.float :F, precission: 4, scale: 2, null: true 
      t.float :P, precission: 4, scale: 2, null: true 
      t.float :I, precission: 4, scale: 2, null: true 
      t.float :Mg, precission: 4, scale: 2, null: true 
      t.float :Cu, precission: 4, scale: 2, null: true 
      t.float :K, precission: 4, scale: 2, null: true 
      t.float :Se, precission: 4, scale: 2, null: true 
      t.float :Na, precission: 4, scale: 2, null: true 
      t.float :Ca, precission: 4, scale: 2, null: true 
      t.float :Fe, precission: 4, scale: 2, null: true
      t.float :Cholesterol, precission: 6, scale: 2, null: true 
     end
  end
end
