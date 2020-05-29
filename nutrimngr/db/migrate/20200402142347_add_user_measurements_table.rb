class AddUserMeasurementsTable < ActiveRecord::Migration[5.2]
  def change
	create_table :UserMeasurements do |t|
	 t.integer :IDU
	 t.float :Weight, precission: 5, scale: 2, null: true
	 t.float :Waist, precission: 5, scale: 2, null: true
	 t.float :Hips, precission: 5, scale: 2, null: true
	 t.date :Date
	end
  end
end
