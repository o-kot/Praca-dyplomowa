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
	 t.integer :Leucine
	 t.integer :Lysine
	 t.integer :Methionine
	 t.integer :Threonine
	 t.numeric :Tryptophan, precision: 2, scale: 1
	 t.integer :Phenylalanine
	 t.integer :VitA
	 t.numeric :VitB1, precision: 2, scale: 1
	 t.numeric :VitB2, precision: 2, scale: 1
	 t.integer :VitB3
	 t.integer :VitB4
	 t.integer :VitB5
	 t.numeric :VitB6, precision: 2, scale: 1
	 t.integer :VitB9
	 t.numeric :VitB12, precision: 2, scale: 1
	 t.numeric :VitC, precision: 2, scale: 1
	 t.integer :VitD
	 t.integer :VitE
	 t.integer :VitH
	 t.integer :VitK
	 t.integer :Cl
	 t.integer :Zn
	 t.numeric :F, precision: 2, scale: 1
	 t.integer :P
	 t.integer :I
	 t.integer :Mg
	 t.numeric :Cu, precision: 2, scale: 1
	 t.integer :K
	 t.integer :Se
	 t.integer :Na
	 t.integer :Ca
	 t.integer :Fe
	end
  end
end
