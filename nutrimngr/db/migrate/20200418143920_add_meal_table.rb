class AddMealTable < ActiveRecord::Migration[5.2]
  def change
	create_table :Meal do |t|
	 t.string :Name, limit: 10
	end
  end
end
