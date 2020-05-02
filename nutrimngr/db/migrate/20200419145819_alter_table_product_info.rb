class AlterTableProductInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :ProductInfo, :IDU, :int, null: true
    add_foreign_key :ProductInfo, :User, column: :IDU
  end
end
