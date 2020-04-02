class AddTargetTable < ActiveRecord::Migration[5.2]
  def change
	create_table :Target do |t|
	 t.string :Description, limit: 20
	end
  end
end
