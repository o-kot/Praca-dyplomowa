class AddAminoAcidsRequisitionTable < ActiveRecord::Migration[5.2]
  def change
	create_table :AminoAcidsRequisition do |t|
	 t.string :Name, limit: 25
	 t.integer :FromAge
	 t.integer :ToAge
	 t.float :Requirement, precission: 3, scale: 2
	end
  end
end
