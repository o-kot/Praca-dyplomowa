class AddUserDataTable < ActiveRecord::Migration[5.2]
  def change
	create_table :UserData do |t|
	 t.integer :IDU
	 t.date :BirthDate
	 t.boolean :IsWoman
	 t.integer :Height
	 t.integer :IDT, null: true
	 t.integer :IDA, null: true
	end
  end
end
