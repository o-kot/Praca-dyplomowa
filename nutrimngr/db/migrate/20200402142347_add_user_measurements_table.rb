class AddUserMeasurementsTable < ActiveRecord::Migration[5.2]
  def change
	create_table :UserMeasurements do |t|
	 t.integer :IDU
	 t.numeric :Weight, precision: 5, scale: 2, null: true
	 t.numeric :Waist, precision: 5, scale: 2, null: true
	 t.numeric :Hips, precision: 5, scale: 2, null: true
	 t.date :Date
	end
  end
end
