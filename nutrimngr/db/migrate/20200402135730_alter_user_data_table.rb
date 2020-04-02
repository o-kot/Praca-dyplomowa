class AlterUserDataTable < ActiveRecord::Migration[5.2]
  def change
	add_foreign_key :UserData, :User, column: :IDU
	add_foreign_key :UserData, :Activity, column: :IDA
	add_foreign_key :UserData, :Target, column: :IDT
	
  end
end
