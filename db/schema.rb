# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131001051705) do

  create_table "choices", force: true do |t|
    t.integer  "exercise_id", null: false
    t.string   "answer"
    t.integer  "order"
    t.text     "feedback"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["exercise_id"], name: "index_choices_on_exercise_id"

  create_table "course_enrollments", force: true do |t|
    t.integer "user_id"
    t.integer "course_offering_id"
    t.integer "course_role_id"
  end

  add_index "course_enrollments", ["course_offering_id"], name: "index_course_enrollments_on_course_offering_id"
  add_index "course_enrollments", ["course_role_id"], name: "index_course_enrollments_on_course_role_id"
  add_index "course_enrollments", ["user_id", "course_offering_id"], name: "index_course_enrollments_on_user_id_and_course_offering_id", unique: true
  add_index "course_enrollments", ["user_id"], name: "index_course_enrollments_on_user_id"

  create_table "course_offerings", force: true do |t|
    t.integer  "course_id"
    t.integer  "term_id"
    t.string   "name"
    t.string   "label"
    t.string   "url"
    t.boolean  "self_enrollment_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_roles", force: true do |t|
    t.string  "name",                                       null: false
    t.boolean "can_manage_course",          default: false, null: false
    t.boolean "can_manage_assignments",     default: false, null: false
    t.boolean "can_grade_submissions",      default: false, null: false
    t.boolean "can_view_other_submissions", default: false, null: false
    t.boolean "builtin",                    default: false, null: false
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "organization_id"
    t.string   "url_part"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.integer  "user_id",            null: false
    t.integer  "stem_id"
    t.integer  "language_id"
    t.string   "title",              null: false
    t.text     "question",           null: false
    t.text     "feedback"
    t.boolean  "is_public",          null: false
    t.integer  "priority",           null: false
    t.integer  "count_attempts",     null: false
    t.float    "count_correct",      null: false
    t.float    "difficulty",         null: false
    t.float    "discrimination",     null: false
    t.integer  "question_type",      null: false
    t.boolean  "mcq_allow_multiple"
    t.boolean  "mcq_is_scrambled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience"
  end

  add_index "exercises", ["language_id"], name: "index_exercises_on_language_id"
  add_index "exercises", ["stem_id"], name: "index_exercises_on_stem_id"
  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "exercises_tags", force: true do |t|
    t.integer "exercise_id"
    t.integer "tag_id"
  end

  create_table "global_roles", force: true do |t|
    t.string  "name",                                          null: false
    t.boolean "can_manage_all_courses",        default: false, null: false
    t.boolean "can_edit_system_configuration", default: false, null: false
    t.boolean "builtin",                       default: false, null: false
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "display_name"
    t.string   "url_part"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stems", force: true do |t|
    t.text     "preamble"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.integer  "season"
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "global_role_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["global_role_id"], name: "index_users_on_global_role_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
