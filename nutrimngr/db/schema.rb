# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_01_173459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Activity", force: :cascade do |t|
    t.string "Description", limit: 100
    t.float "PAL"
  end

  create_table "AminoAcidsRequisition", force: :cascade do |t|
    t.string "Name", limit: 25
    t.integer "FromAge"
    t.integer "ToAge"
    t.float "Requirement"
  end

  create_table "CompleteRecipe", force: :cascade do |t|
    t.integer "IDR"
    t.boolean "IsActive"
    t.boolean "HasPortions"
    t.integer "HowManyPortions"
    t.boolean "IsWeighted"
    t.float "Weight"
    t.float "WhatIsLeft"
    t.float "Calories"
    t.float "Protein"
    t.float "Carbs"
    t.float "Fat"
    t.float "Sugars"
    t.float "Fiber"
    t.float "Omega3"
    t.float "ALA"
    t.float "SFA"
    t.float "WNKT"
    t.float "Trans"
    t.float "Valine"
    t.float "Isoleucine"
    t.float "Leucine"
    t.float "Lysine"
    t.float "Methionine"
    t.float "Threonine"
    t.float "Tryptophan"
    t.float "Phenylalanine"
    t.float "VitA"
    t.float "VitB1"
    t.float "VitB2"
    t.float "VitB3"
    t.float "VitB4"
    t.float "VitB5"
    t.float "VitB6"
    t.float "VitB9"
    t.float "VitB12"
    t.float "VitC"
    t.float "VitD"
    t.float "VitE"
    t.float "VitH"
    t.float "VitK"
    t.float "Cl"
    t.float "Zn"
    t.float "F"
    t.float "P"
    t.float "I"
    t.float "Mg"
    t.float "Cu"
    t.float "K"
    t.float "Se"
    t.float "Na"
    t.float "Ca"
    t.float "Fe"
    t.decimal "Cholesterol", precision: 5, scale: 2
  end

  create_table "Eaten", force: :cascade do |t|
    t.integer "IDU"
    t.integer "IDP"
    t.date "Date"
    t.time "Time"
    t.integer "IDPr"
    t.integer "IDDR"
    t.string "CustomProductName", limit: 50
    t.float "Weight"
    t.integer "Portions"
    t.float "Calories"
    t.float "Protein"
    t.float "Carbs"
    t.float "Fat"
    t.float "Sugars"
    t.float "Fiber"
    t.float "Omega3"
    t.float "ALA"
    t.float "SFA"
    t.float "WNKT"
    t.float "Trans"
    t.float "Valine"
    t.float "Isoleucine"
    t.float "Leucine"
    t.float "Lysine"
    t.float "Methionine"
    t.float "Threonine"
    t.float "Tryptophan"
    t.float "Phenylalanine"
    t.float "VitA"
    t.float "VitB1"
    t.float "VitB2"
    t.float "VitB3"
    t.float "VitB4"
    t.float "VitB5"
    t.float "VitB6"
    t.float "VitB9"
    t.float "VitB12"
    t.float "VitC"
    t.float "VitD"
    t.float "VitE"
    t.float "VitH"
    t.float "VitK"
    t.float "Cl"
    t.float "Zn"
    t.float "F"
    t.float "P"
    t.float "I"
    t.float "Mg"
    t.float "Cu"
    t.float "K"
    t.float "Se"
    t.float "Na"
    t.float "Ca"
    t.float "Fe"
    t.decimal "Cholesterol", precision: 5, scale: 2
  end

  create_table "GeneralRequisition", force: :cascade do |t|
    t.integer "FromAge"
    t.integer "ToAge"
    t.boolean "IsWoman"
    t.string "Name", limit: 25
    t.float "Requirement"
  end

  create_table "Meal", force: :cascade do |t|
    t.string "Name", limit: 15
  end

  create_table "ProductInfo", force: :cascade do |t|
    t.string "Name", limit: 100
    t.float "Calories"
    t.float "Protein"
    t.float "Carbs"
    t.float "Fat"
    t.float "Sugars"
    t.float "Fiber"
    t.float "Omega3"
    t.float "ALA"
    t.float "SFA"
    t.float "WNKT"
    t.float "Trans"
    t.float "Valine"
    t.float "Isoleucine"
    t.float "Leucine"
    t.float "Lysine"
    t.float "Methionine"
    t.float "Threonine"
    t.float "Tryptophan"
    t.float "Phenylalanine"
    t.float "VitA"
    t.float "VitB1"
    t.float "VitB2"
    t.float "VitB3"
    t.float "VitB4"
    t.float "VitB5"
    t.float "VitB6"
    t.float "VitB9"
    t.float "VitB12"
    t.float "VitC"
    t.float "VitD"
    t.float "VitE"
    t.float "VitH"
    t.float "VitK"
    t.float "Cl"
    t.float "Zn"
    t.float "F"
    t.float "P"
    t.float "I"
    t.float "Mg"
    t.float "Cu"
    t.float "K"
    t.float "Se"
    t.float "Na"
    t.float "Ca"
    t.float "Fe"
    t.integer "IDU"
    t.decimal "Cholesterol", precision: 6, scale: 2
  end

  create_table "ProteinRequisition", force: :cascade do |t|
    t.integer "FromAge"
    t.integer "ToAge"
    t.float "Requirement"
  end

  create_table "Recipe", force: :cascade do |t|
    t.integer "IDU"
    t.string "Name", limit: 100
    t.boolean "IsActive"
  end

  create_table "RecipeProducts", force: :cascade do |t|
    t.integer "IDP"
    t.float "Weight"
    t.integer "IDR"
  end

  create_table "TEST", force: :cascade do |t|
    t.string "Name", limit: 100
    t.decimal "Calories", precision: 6, scale: 2
    t.decimal "Protein", precision: 5, scale: 2
  end

  create_table "Target", force: :cascade do |t|
    t.string "Description", limit: 20
  end

  create_table "User", force: :cascade do |t|
    t.string "Login", limit: 100
    t.string "Password", limit: 100
  end

  create_table "UserData", force: :cascade do |t|
    t.integer "IDU"
    t.date "BirthDate"
    t.boolean "IsWoman"
    t.integer "Height"
    t.integer "IDT"
    t.integer "IDA"
  end

  create_table "UserMeasurements", force: :cascade do |t|
    t.integer "IDU"
    t.float "Weight"
    t.float "Waist"
    t.float "Hips"
    t.date "Date"
  end

  create_table "UserRequisition", force: :cascade do |t|
    t.integer "IDU"
    t.integer "PPM"
    t.integer "CPM"
    t.integer "TargetCalories"
    t.integer "Protein"
    t.integer "Carbs"
    t.integer "Valine"
    t.integer "Isoleucine"
    t.integer "Leucine"
    t.integer "Lysine"
    t.integer "Methionine"
    t.integer "Threonine"
    t.float "Tryptophan"
    t.integer "Phenylalanine"
    t.integer "VitA"
    t.float "VitB1"
    t.float "VitB2"
    t.integer "VitB3"
    t.integer "VitB4"
    t.integer "VitB5"
    t.float "VitB6"
    t.integer "VitB9"
    t.float "VitB12"
    t.float "VitC"
    t.integer "VitD"
    t.integer "VitE"
    t.integer "VitH"
    t.integer "VitK"
    t.integer "Cl"
    t.integer "Zn"
    t.float "F"
    t.integer "P"
    t.integer "I"
    t.integer "Mg"
    t.float "Cu"
    t.integer "K"
    t.integer "Se"
    t.integer "Na"
    t.integer "Ca"
    t.integer "Fe"
  end

  create_table "food", id: false, force: :cascade do |t|
    t.integer "fdc_id"
    t.text "data_type"
    t.text "description"
    t.text "food_category_id"
    t.text "publication_date"
  end

  create_table "food_category", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "code"
    t.text "description"
  end

  create_table "food_export", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "data_type"
    t.text "food"
    t.text "nutrient"
    t.text "food_category"
    t.text "unit"
    t.text "amount"
  end

  create_table "food_export_2", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "data_type"
    t.text "food"
    t.text "nutrient"
    t.text "food_category"
    t.text "unit"
    t.text "amount"
  end

  create_table "food_export_old", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "data_type"
    t.text "food"
    t.text "nutrient"
    t.text "food_category"
    t.text "unit"
    t.text "amount"
  end

  create_table "food_import", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "data_type"
    t.text "food"
    t.text "food_category"
    t.text "lactose"
    t.text "vitamin_k_phylloquinone"
    t.text "sugars_total_including_nlea"
    t.text "tryptophan"
    t.text "copper_cu"
    t.text "n183_n_3_ccc_ala"
    t.text "vitamin_k_dihydrophylloquinone"
    t.text "vitamin_d_d2_plus_d3_international_units"
    t.text "vitamin_b_6"
    t.text "phenylalanine"
    t.text "vitamin_a_rae"
    t.text "zinc_zn"
    t.text "selenium_se"
    t.text "potassium_k"
    t.text "iron_fe"
    t.text "n226_n_3_dha"
    t.text "niacin"
    t.text "protein"
    t.text "sugars_total_nlea"
    t.text "vitamin_d_d2_plus_d3"
    t.text "isoleucine"
    t.text "folate_dfe"
    t.text "cholesterol"
    t.text "vitamin_k_menaquinone_4"
    t.text "fatty_acids_total_saturated"
    t.text "leucine"
    t.text "threonine"
    t.text "total_dietary_fiber_aoac_2011_25"
    t.text "thiamin"
    t.text "vitamin_a_iu"
    t.text "n205_n_3_epa"
    t.text "lysine"
    t.text "vitamin_c_total_ascorbic_acid"
    t.text "carbohydrate_by_difference"
    t.text "sodium_na"
    t.text "methionine"
    t.text "folate_food"
    t.text "pantothenic_acid"
    t.text "iodine_i"
    t.text "fatty_acids_total_trans"
    t.text "phosphorus_p"
    t.text "cysteine"
    t.text "carbohydrate_by_summation"
    t.text "energy"
    t.text "fluoride_f"
    t.text "calcium_ca"
    t.text "folate_total"
    t.text "fiber_total_dietary"
    t.text "biotin"
    t.text "folic_acid"
    t.text "magnesium_mg"
    t.text "valine"
    t.text "vitamin_e_alpha_tocopherol"
    t.text "vitamin_b_12"
    t.text "total_lipid_fat"
    t.text "fatty_acids_total_polyunsaturated"
  end

  create_table "food_nutrient", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "fdc_id"
    t.integer "nutrient_id"
    t.text "amount"
    t.text "data_points"
    t.text "derivation_id"
    t.text "min"
    t.text "max"
    t.text "median"
    t.text "footnote"
    t.text "min_year_acquired"
  end

  create_table "foods", id: false, force: :cascade do |t|
    t.text "food"
    t.text "food_category"
    t.text "nutrient"
    t.text "unit"
    t.text "amount"
  end

  create_table "foods_old", id: false, force: :cascade do |t|
    t.text "food"
    t.text "food_category"
    t.text "nutrient"
    t.text "unit"
    t.text "amount"
  end

  create_table "nutrient", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "name"
    t.text "unit_name"
    t.float "nutrient_nbr"
    t.text "rank"
  end

  add_foreign_key "CompleteRecipe", "\"Recipe\"", column: "IDR"
  add_foreign_key "Eaten", "\"CompleteRecipe\"", column: "IDDR"
  add_foreign_key "Eaten", "\"Meal\"", column: "IDP"
  add_foreign_key "Eaten", "\"ProductInfo\"", column: "IDPr"
  add_foreign_key "Eaten", "\"User\"", column: "IDU"
  add_foreign_key "ProductInfo", "\"User\"", column: "IDU"
  add_foreign_key "Recipe", "\"User\"", column: "IDU"
  add_foreign_key "RecipeProducts", "\"ProductInfo\"", column: "IDP"
  add_foreign_key "RecipeProducts", "\"Recipe\"", column: "IDR"
  add_foreign_key "UserData", "\"Activity\"", column: "IDA"
  add_foreign_key "UserData", "\"Target\"", column: "IDT"
  add_foreign_key "UserData", "\"User\"", column: "IDU"
  add_foreign_key "UserMeasurements", "\"User\"", column: "IDU"
  add_foreign_key "UserRequisition", "\"User\"", column: "IDU"
end
