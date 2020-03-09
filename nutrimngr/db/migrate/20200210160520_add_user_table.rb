class AddUserTable < ActiveRecord::Migration[5.2]
  def change
	create_table :User do |t|
	 t.string :Login, limit: 100
	 t.string :Password, limit: 100
	end

  end
end
