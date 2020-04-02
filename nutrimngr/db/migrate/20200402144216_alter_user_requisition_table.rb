class AlterUserRequisitionTable < ActiveRecord::Migration[5.2]
  def change
	add_foreign_key :UserRequisition, :User, column: :IDU
  end
end
