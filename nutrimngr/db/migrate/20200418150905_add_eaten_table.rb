class AddEatenTable < ActiveRecord::Migration[5.2]
  def change
    create_table :Eaten do |t|
      t.integer :IDU
      t.integer :IDP
      t.date :Date
      t.time :Time
      t.integer :IDPr, null: true
      t.integer :IDDR, null: true
      t.string :CustomProductName, limit: 150, nul: true
      t.numeric :Weight, precision: 6, scale: 2, null: true
      t.integer :Portions, null: true
      t.numeric :Calories, precision: 6, scale: 2, null: true
      t.numeric :Protein, precision: 6, scale: 2, null: true
      t.numeric :Carbs, precision: 6, scale: 2, null: true
      t.numeric :Fat, precision: 6, scale: 2, null: true
      t.numeric :Sugars, precision: 5, scale: 2, null: true
      t.numeric :Fiber, precision: 5, scale: 2, null: true
      t.numeric :Omega3, precision: 6, scale: 3, null: true
      t.numeric :ALA, precision: 6, scale: 3, null: true
      t.numeric :SFA, precision: 6, scale: 3, null: true
      t.numeric :WNKT, precision: 6, scale: 3, null: true
      t.numeric :Trans, precision: 6, scale: 3, null: true
      t.numeric :Valine, precision: 6, scale: 2, null: true
      t.numeric :Isoleucine, precision: 6, scale: 2, null: true
      t.numeric :Leucine, precision: 6, scale: 2, null: true
      t.numeric :Lysine, precision: 6, scale: 2, null: true
      t.numeric :Methionine, precision: 6, scale: 2, null: true
      t.numeric :Threonine, precision: 6, scale: 2, null: true
      t.numeric :Tryptophan, precision: 6, scale: 3, null: true
      t.numeric :Phenylalanine, precision: 6, scale: 2, null: true
      t.numeric :VitA, precision: 6, scale: 3, null: true
      t.numeric :VitB1, precision: 6, scale: 3, null: true
      t.numeric :VitB3, precision: 6, scale: 3, null: true
      t.numeric :VitB3, precision: 6, scale: 3, null: true
      t.numeric :VitB6, precision: 6, scale: 3, null: true
      t.numeric :VitB5, precision: 6, scale: 3, null: true
      t.numeric :VitB6, precision: 6, scale: 3, null: true
      t.numeric :VitB9, precision: 6, scale: 3, null: true
      t.numeric :VitB13, precision: 6, scale: 3, null: true
      t.numeric :VitC, precision: 6, scale: 3, null: true
      t.numeric :VitD, precision: 6, scale: 3, null: true
      t.numeric :VitE, precision: 6, scale: 3, null: true
      t.numeric :VitH, precision: 6, scale: 3, null: true
      t.numeric :VitK, precision: 6, scale: 3, null: true
      t.numeric :Cl, precision: 6, scale: 3, null: true
      t.numeric :Zn, precision: 6, scale: 3, null: true
      t.numeric :F, precision: 6, scale: 3, null: true
      t.numeric :P, precision: 6, scale: 3, null: true
      t.numeric :I, precision: 6, scale: 3, null: true
      t.numeric :Mg, precision: 6, scale: 3, null: true
      t.numeric :Cu, precision: 6, scale: 3, null: true
      t.numeric :K, precision: 6, scale: 3, null: true
      t.numeric :Se, precision: 6, scale: 3, null: true
      t.numeric :Na, precision: 6, scale: 2, null: true
      t.numeric :Ca, precision: 6, scale: 3, null: true
      t.numeric :Fe, precision: 6, scale: 3, null: true
      t.numeric :Cholesterol, precision: 6, scale: 3, null: true
      end
  end
end
