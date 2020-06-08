class GeneralRequisitionAlterRequirementPrecision < ActiveRecord::Migration[5.2]
  def change
	alter_column :GeneralRequisition, :Requirement, t.numeric, precision: 5, scale: 2
  end
end
