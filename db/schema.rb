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

ActiveRecord::Schema[7.0].define(version: 2022_06_01_063129) do
  create_table "sessions", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subtasks", charset: "utf8", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "description", null: false
    t.boolean "completed", default: false, null: false
    t.index ["task_id"], name: "index_subtasks_on_task_id"
  end

  create_table "tasks", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.date "deadline"
    t.boolean "completed", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "assignee_id"
    t.boolean "public", default: false, null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "display_name", default: "名無しさん"
  end

  add_foreign_key "sessions", "users"
  add_foreign_key "subtasks", "tasks", column: "id", name: "task_id"
end
