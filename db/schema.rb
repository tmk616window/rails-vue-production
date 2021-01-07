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

ActiveRecord::Schema.define(version: 2021_01_07_055753) do

  create_table "itags", charset: "utf8", force: :cascade do |t|
    t.string "tag"
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_itags_on_task_id"
  end

  create_table "ptags", charset: "utf8", force: :cascade do |t|
    t.string "tag"
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_ptags_on_task_id"
  end

  create_table "taskcomments", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_taskcomments_on_task_id"
  end

  create_table "tasks", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "front_point"
    t.integer "backend_point"
    t.integer "plan_point"
    t.integer "infra_point"
    t.integer "unique_point"
    t.integer "user_point"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.string "password_digest"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "itags", "tasks"
  add_foreign_key "ptags", "tasks"
  add_foreign_key "taskcomments", "tasks"
  add_foreign_key "tasks", "users"
end
