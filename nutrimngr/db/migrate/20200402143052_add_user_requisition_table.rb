class AddUserRequisitionTable < ActiveRecord::Migration[5.2]
  def change
	create_table :UserRequisition do |t|
	 t.integer :IDU
	 t.integer :PPM
	 t.integer :CPM
	 t.integer :TargetCalories
	 t.integer :Protein
	 t.integer :Carbs
	 t.integer :Valine
	 t.integer :Isoleucine
	 t.integer :Leuccine
	 t.integer :Lysine
	 t.integer :Methionine
	 t.integer :Threonine
	 t.float :Tryptophan, precission: 2, scale: 1
	 t.integer :Phenylalanine
	 t.integer :VitA
	 t.float :VitB1, precission: 2, scale: 1
	 t.float :VitB2, precission: 2, scale: 1
	 t.integer :VitB3
	 t.integer :VitB4
	 t.integer :VitB5
	 t.float :VitB6, precission: 2, scale: 1
	 t.integer :VitB9
	 t.float :VitB12, precission: 2, scale: 1
	 t.float :VitC, precission: 2, scale: 1
	 t.integer :VitD
	 t.integer :VitE
	 t.integer :VitH
	 t.integer :VitK
	 t.integer :Cl
	 t.integer :Zn
	 t.float :F, precission: 2, scale: 1
	 t.integer :P
	 t.integer :I
	 t.integer :Mg
	 t.float :Cu, precission: 2, scale: 1
	 t.integer :K
	 t.integer :Se
	 t.integer :Na
	 t.integer :Ca
	 t.integer :Fe
	end
  end
end
