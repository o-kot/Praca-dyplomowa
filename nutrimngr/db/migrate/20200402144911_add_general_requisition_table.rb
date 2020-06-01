class AddGeneralRequisitionTable < ActiveRecord::Migration[5.2]
  def change
	create_table :GeneralRequisition do |t|
	 t.integer :FromAge
	 t.integer :ToAge
	 t.boolean :IsWoman
	 t.string :Name, limit: 25
	 t.numeric :Requirement, precision: 3, scale: 2
	end
  end
end
