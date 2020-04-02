class AlterUserMeasurementsTable < ActiveRecord::Migration[5.2]
  def change
	add_foreign_key :UserMeasurements, :User, column: :IDU
  end
end
