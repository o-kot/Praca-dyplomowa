class AddProductInfoTable < ActiveRecord::Migration[5.3]
  def change
	create_table :ProductInfo do |t|
	 t.string :Name, limit: 100
	 t.float :Calories, precission: 6, scale: 2
	 t.float :Protein, precission: 5, scale: 2
	 t.float :Carbs, precission: 5, scale: 2
	 t.float :Fat, precission: 6, scale: 2
	 t.float :Sugars, precission: 5, sclae: 3, null: true
	 t.float :Fiber, precission: 5, scale: 3, null: true
	 t.float :Omega3, precission: 6, scale: 3, null: true
	 t.float :ALA, precission: 6, scale: 3, null: true
	 t.float :SFA, precission: 6, scale: 3, null: true
	 t.float :WNKT, precission: 6, scale: 3, null: true
	 t.float :Trans, precission: 6, scale: 3, null: true
	 t.float :Valine, precission: 6, scale: 3, null: true
	 t.float :Isoleucine, precission: 6, scale: 3, null: true
	 t.float :Leucine, precission: 6, scale: 3, null: true
	 t.float :Lysine, precission: 6, scale: 3, null: true
	 t.float :Methionine, precission: 6, scale: 3, null: true
	 t.float :Threonine, precission: 6, scale: 3, null: true
	 t.float :Tryptophan, precission: 6, scale: 3, null: true
	 t.float :Phenylalanine, precission: 6, scale: 3, null: true
	 t.float :VitA, precission: 6, scale: 3, null: true
	 t.float :VitB1, precission: 6, scale: 3, null: true
	 t.float :VitB3, precission: 6, scale: 3, null: true
	 t.float :VitB3, precission: 6, scale: 3, null: true
	 t.float :VitB6, precission: 6, scale: 3, null: true
	 t.float :VitB5, precission: 6, scale: 3, null: true
	 t.float :VitB6, precission: 6, scale: 3, null: true
	 t.float :VitB9, precission: 6, scale: 3, null: true
	 t.float :VitB9, precission: 6, scale: 3, null: true
	 t.float :VitB13, precission: 6, scale: 3, null: true
	 t.float :VitC, precission: 6, scale: 3, null: true
	 t.float :VitD, precission: 6, scale: 3, null: true
	 t.float :VitE, precission: 6, scale: 3, null: true
	 t.float :VitH, precission: 6, scale: 3, null: true
	 t.float :VitK, precission: 6, scale: 3, null: true
	 t.float :Cl, precission: 6, scale: 3, null: true
	 t.float :Zn, precission: 6, scale: 3, null: true
	 t.float :F, precission: 6, scale: 3, null: true
	 t.float :P, precission: 6, scale: 3, null: true
	 t.float :I, precission: 6, scale: 3, null: true
	 t.float :Mg, precission: 6, scale: 3, null: true
	 t.float :Cu, precission: 6, scale: 3, null: true
	 t.float :K, precission: 6, scale: 3, null: true
	 t.float :Se, precission: 6, scale: 3, null: true
	 t.float :Na, precission: 6, scale: 3, null: true
	 t.float :Ca, precission: 6, scale: 3, null: true
	 t.float :Fe, precission: 6, scale: 3, null: true	
	 t.float :Cholesterol, precission: 5, scale: 3, null: true 
	end
  end
end
