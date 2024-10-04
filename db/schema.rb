# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_04_014846) do
  create_schema "clases"
  create_schema "cuestionarios"
  create_schema "movie"
  create_schema "pruebaBBDD"

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "farmer_id", null: false
    t.index ["farmer_id"], name: "index_animals_on_farmer_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.string "alcoholic_grade"
    t.string "yeast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colaborators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentaryfilms", force: :cascade do |t|
    t.string "df_name"
    t.string "df_synopsis"
    t.string "df_director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmers", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "farm_id"
    t.index ["farm_id"], name: "index_farmers_on_farm_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie_name"
    t.string "movie_synopsis"
    t.string "movie_director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.string "name"
    t.index ["client_id"], name: "index_movies_on_client_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pelicula", primary_key: "idpelicula", id: :serial, force: :cascade do |t|
    t.string "nombre", limit: 255, null: false
    t.integer "agno", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.string "serie_name"
    t.string "serie_synopsis"
    t.string "serie_director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag", primary_key: "idtag", id: :serial, force: :cascade do |t|
    t.string "descripcion", limit: 32, null: false
  end

  create_table "tagpelicula", primary_key: "idtagpelicula", id: :serial, force: :cascade do |t|
    t.integer "idpelicula"
    t.integer "idtag"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "email"
  end

  create_table "world_cup_teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "farmers"
  add_foreign_key "farmers", "farms"
  add_foreign_key "movies", "clients"
  add_foreign_key "tagpelicula", "pelicula", column: "idpelicula", primary_key: "idpelicula", name: "tagpelicula_idpelicula_fkey"
  add_foreign_key "tagpelicula", "tag", column: "idtag", primary_key: "idtag", name: "tagpelicula_idtag_fkey"
  add_foreign_key "treatments", "patients"
end
