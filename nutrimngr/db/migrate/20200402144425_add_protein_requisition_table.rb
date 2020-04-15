class AddProteinRequisitionTable < ActiveRecord::Migration[5.2]
  def change
	create_table :ProteinRequisition do |t|
	 t.integer :FromAge
	 t.integer :ToAge
	 t.float :Requirement, precission: 3, scale: 2
	end
  end
end