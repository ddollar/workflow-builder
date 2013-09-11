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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121220212010) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "uuid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.integer  "app_id"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "set_current"
    t.text     "set_desired"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "num"
    t.string   "type"
    t.text     "args_raw"
    t.integer  "workflow_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "run_id"
  end

  create_table "runs", :force => true do |t|
    t.string   "state"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "workflow_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "steps", :force => true do |t|
    t.integer  "num"
    t.string   "type"
    t.text     "args_raw"
    t.integer  "workflow_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "run_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "status"
  end

  create_table "triggers", :force => true do |t|
    t.integer  "num"
    t.string   "type"
    t.text     "args_raw"
    t.integer  "workflow_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "run_id"
  end

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "github_token"
  end

  create_table "workflows", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
