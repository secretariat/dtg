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

ActiveRecord::Schema.define(:version => 20130219210012) do

  create_table "admins", :force => true do |t|
    t.integer  "main_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chmails", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "edizms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "garantees", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mains", :force => true do |t|
    t.string   "login",      :limit => 20
    t.string   "hash_pass"
    t.string   "hash_salt"
    t.integer  "owner_id"
    t.integer  "priv_level"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "main_id"
    t.string   "pib"
    t.string   "postion"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "zayavka_id"
    t.string   "naim"
    t.string   "codyktved"
    t.string   "nomenkl"
    t.integer  "kolvo"
    t.integer  "factstoim"
    t.string   "dopinfo"
    t.string   "opis_all"
    t.integer  "pos_stavka"
    t.integer  "pos_summa"
    t.integer  "nalog_stavka"
    t.integer  "nalog_summa"
    t.integer  "neft_stavka"
    t.integer  "neft_summa"
    t.integer  "nds_stavka"
    t.integer  "nds_summa"
    t.integer  "vsego"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "edizm",         :default => "шт."
    t.string   "currency"
    t.string   "factstoim_all"
  end

  create_table "transports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "main_id"
    t.string   "cname"
    t.string   "uaddr"
    t.string   "phone"
    t.string   "chef"
    t.string   "email"
    t.string   "dognum"
    t.date     "dogdate"
    t.string   "edrpo"
    t.string   "gdcode"
    t.string   "pib"
    t.integer  "zcount",     :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "zayavkas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "usercount"
    t.string   "tamrez"
    t.string   "typetran"
    t.integer  "garantee"
    t.integer  "status"
    t.string   "field_1_1"
    t.string   "field_1_2"
    t.string   "field_1_3"
    t.string   "field_3_1"
    t.string   "field_3_2"
    t.string   "field_3_3"
    t.string   "field_3_4"
    t.string   "field_4_1"
    t.string   "field_4_2"
    t.string   "field_4_3"
    t.string   "field_5_1"
    t.string   "field_5_2"
    t.string   "field_5_3"
    t.string   "field_5_4"
    t.string   "field_5_5"
    t.string   "field_5_6"
    t.string   "field_5_7"
    t.string   "field_7_1"
    t.string   "field_7_2"
    t.string   "field_7_3"
    t.string   "field_7_4"
    t.string   "field_8_1"
    t.string   "field_8_2"
    t.string   "field_8_3"
    t.string   "field_8_4_1"
    t.string   "field_8_4_2"
    t.string   "field_8_5"
    t.string   "field_8_6"
    t.string   "field_8_7"
    t.string   "field_9"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "own_comments"
  end

  add_index "zayavkas", ["user_id"], :name => "index_zayavkas_on_user_id"

end
