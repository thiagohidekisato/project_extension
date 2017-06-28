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

ActiveRecord::Schema.define(version: 20170521052119) do

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "ramal"
    t.string "phone_cel"
    t.string "specialization"
    t.string "room"
    t.string "lattes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_professors_on_email", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "date_start"
    t.string "date_finish"
    t.boolean "fomento"
    t.string "local"
    t.string "images"
    t.text "description"
    t.integer "n_participants"
    t.integer "v_volunteers"
    t.integer "v_bolsistas"
    t.text "perfil_volunteers"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id", "created_at"], name: "index_projects_on_professor_id_and_created_at"
    t.index ["professor_id"], name: "index_projects_on_professor_id"
  end

end
