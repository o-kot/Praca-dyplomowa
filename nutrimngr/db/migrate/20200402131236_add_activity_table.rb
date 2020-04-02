class AddActivityTable < ActiveRecord::Migration[5.2]
  def change
	create_table :Activity do |t|
	 t.string :Description, limit: 100
	 t.float :PAL, precision: 2, scale: 1
	end
  end
end
