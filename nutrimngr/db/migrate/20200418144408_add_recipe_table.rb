class AddRecipeTable < ActiveRecord::Migration[5.2]
  def change
	create_table :Recipe do |t|
	 t.integer :IDU
	 t.string :Name, limit: 100
	 t.boolean :IsActive	 
	end
  end
end
