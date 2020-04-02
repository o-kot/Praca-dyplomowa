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

ActiveRecord::Schema.define(version: 2020_04_02_144911) do

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

  create_table "GeneralRequisition", force: :cascade do |t|
    t.integer "FromAge"
    t.integer "ToAge"
    t.boolean "IsWoman"
    t.string "Name", limit: 25
    t.float "Requirement"
  end

  create_table "ProteinRequisition", force: :cascade do |t|
    t.integer "FromAge"
    t.integer "ToAge"
    t.float "Requirement"
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
    t.integer "Leuccine"
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

  add_foreign_key "UserData", "\"Activity\"", column: "IDA"
  add_foreign_key "UserData", "\"Target\"", column: "IDT"
  add_foreign_key "UserData", "\"User\"", column: "IDU"
  add_foreign_key "UserMeasurements", "\"User\"", column: "IDU"
  add_foreign_key "UserRequisition", "\"User\"", column: "IDU"
end
